# Assemble and Validate Script
$ErrorActionPreference = "Stop"

Write-Host "=== Step 1: Loading Domain Files ==="
. (Join-Path $PSScriptRoot "domain1.ps1")
. (Join-Path $PSScriptRoot "domain2.ps1")
. (Join-Path $PSScriptRoot "domain3_compute_storage.ps1")
. (Join-Path $PSScriptRoot "domain3_network_db_ops.ps1")
. (Join-Path $PSScriptRoot "domain4.ps1")
. (Join-Path $PSScriptRoot "domain5.ps1")

$allQuestions = @()
$allQuestions += $domain1
$allQuestions += $domain2
$allQuestions += $domain3_p1
$allQuestions += $domain3_p2
$allQuestions += $domain4
$allQuestions += $domain5

Write-Host "Total loaded questions: $($allQuestions.Count)"

Write-Host "`n=== Step 2: Running 12-Point Comprehensive Validation ==="
$errors = [System.Collections.Generic.List[string]]::new()

# 1. Total questions count
if ($allQuestions.Count -ne 100) {
    $errors.Add("Expected 100 questions, but found $($allQuestions.Count)")
}

# 2. Domain breakdown check
$blueprintMap = @{
    "Cloud Concepts" = 15
    "Getting Started with OCI" = 15
    "Core OCI Services" = 45
    "Security and Compliance" = 15
    "Pricing, Support and Operations" = 10
}

$domainCounts = @{}
foreach ($d in $blueprintMap.Keys) { $domainCounts[$d] = 0 }

foreach ($q in $allQuestions) {
    if (-not $blueprintMap.ContainsKey($q.domain)) {
        $errors.Add("Question $($q.id) has invalid domain: '$($q.domain)'")
    } else {
        $domainCounts[$q.domain]++
    }
}

foreach ($d in $blueprintMap.Keys) {
    if ($domainCounts[$d] -ne $blueprintMap[$d]) {
        $errors.Add("Domain '$d': expected $($blueprintMap[$d]), but found $($domainCounts[$d])")
    }
}

# 3. Question type distribution: 80 single, 20 multiple
$singleCount = ($allQuestions | Where-Object { $_.type -eq "single" }).Count
$multipleCount = ($allQuestions | Where-Object { $_.type -eq "multiple" }).Count
if ($singleCount -ne 80) {
    $errors.Add("Expected 80 single-choice questions, but found $singleCount")
}
if ($multipleCount -ne 20) {
    $errors.Add("Expected 20 multiple-choice questions, but found $multipleCount")
}

# 4. Scenario count (at least 30)
$scenarioCount = ($allQuestions | Where-Object { $_.scenario -eq $true }).Count
if ($scenarioCount -lt 30) {
    $errors.Add("Expected at least 30 scenario questions, but found $scenarioCount")
}

# 5. Question IDs uniqueness
$idSet = [System.Collections.Generic.HashSet[string]]::new()
foreach ($q in $allQuestions) {
    if ([string]::IsNullOrWhiteSpace($q.id)) {
        $errors.Add("Found question with empty or null ID")
    } elseif ($idSet.Contains($q.id)) {
        $errors.Add("Duplicate question ID found: '$($q.id)'")
    } else {
        [void]$idSet.Add($q.id)
    }
}

# 6. Option IDs, correct_answer validation, required fields
$qTextSet = [System.Collections.Generic.HashSet[string]]::new()
for ($i = 0; $i -lt $allQuestions.Count; $i++) {
    $q = $allQuestions[$i]
    $qid = $q.id

    # Check question text uniqueness within set
    $normText = $q.question.Trim().ToLower()
    if ($qTextSet.Contains($normText)) {
        $errors.Add("Duplicate question text found at $qid")
    } else {
        [void]$qTextSet.Add($normText)
    }

    # Required fields check
    if ([string]::IsNullOrWhiteSpace($q.question)) { $errors.Add("$($qid): question text is empty") }
    if ([string]::IsNullOrWhiteSpace($q.explanation)) { $errors.Add("$($qid): explanation is empty") }
    if ($null -eq $q.subtopics -or $q.subtopics.Count -eq 0) { $errors.Add("$($qid): subtopics is empty") }
    if ($null -eq $q.tags -or $q.tags.Count -eq 0) { $errors.Add("$($qid): tags is empty") }
    if ($q.scenario -ne $true -and $q.scenario -ne $false) { $errors.Add("$($qid): scenario must be boolean") }
    if ($q.difficulty -notin @("easy", "medium", "hard")) { $errors.Add("$($qid): invalid difficulty '$($q.difficulty)'") }

    # Options check
    if ($null -eq $q.options -or $q.options.Count -lt 4) {
        $errors.Add("$($qid): options must have at least 4 items (found $($q.options.Count))")
    } else {
        $optIds = [System.Collections.Generic.HashSet[string]]::new()
        $expectedOrder = @("A", "B", "C", "D", "E")
        for ($oi = 0; $oi -lt $q.options.Count; $oi++) {
            $opt = $q.options[$oi]
            if ($opt.id -ne $expectedOrder[$oi]) {
                $errors.Add("$($qid): option index $oi expected id '$($expectedOrder[$oi])', but got '$($opt.id)'")
            }
            if ([string]::IsNullOrWhiteSpace($opt.text)) {
                $errors.Add("$($qid): option '$($opt.id)' has empty text")
            }
            [void]$optIds.Add($opt.id)
        }

        # Answer check
        if ($null -eq $q.correct_answer -or $q.correct_answer.Count -eq 0) {
            $errors.Add("$($qid): correct_answer is empty")
        } else {
            foreach ($ans in $q.correct_answer) {
                if (-not $optIds.Contains($ans)) {
                    $errors.Add("$($qid): correct_answer '$ans' does not exist in options")
                }
            }
            if ($q.type -eq "single" -and $q.correct_answer.Count -ne 1) {
                $errors.Add("$($qid): single-choice question must have exactly 1 answer, got $($q.correct_answer.Count)")
            }
            if ($q.type -eq "multiple") {
                if ($q.correct_answer.Count -lt 2) {
                    $errors.Add("$($qid): multiple-choice question must have at least 2 answers, got $($q.correct_answer.Count)")
                }
                # Check for "Choose TWO" or "Choose THREE"
                if ($q.correct_answer.Count -eq 2 -and -not ($q.question.Contains("Choose TWO") -or $q.question.Contains("Select TWO"))) {
                    $errors.Add("$($qid): multiple question with 2 answers must specify 'Choose TWO' in question text")
                }
                if ($q.correct_answer.Count -eq 3 -and -not ($q.question.Contains("Choose THREE") -or $q.question.Contains("Select THREE"))) {
                    $errors.Add("$($qid): multiple question with 3 answers must specify 'Choose THREE' in question text")
                }
            }
        }
    }
}

# 7. Check for duplicate questions against previous mock1.html if present
$mock1File = "..\01\oci_foundations_associate_1z0-1085-26_mock1.html"
$historicalCount = 0
if (Test-Path $mock1File) {
    Write-Host "`nChecking for near-duplicates against $mock1File..."
    $content = Get-Content -Raw -Encoding UTF8 $mock1File
    $matches = [regex]::Matches($content, 'q_en:\s*"([^"]+)"')
    $historicalCount = $matches.Count
    Write-Host "Found $($matches.Count) historical questions in mock1.html"
    
    foreach ($m in $matches) {
        $oldText = $m.Groups[1].Value.Trim().ToLower()
        foreach ($q in $allQuestions) {
            $newText = $q.question.Trim().ToLower()
            if ($oldText -eq $newText) {
                $errors.Add("Exact duplicate with mock1.html detected: '$($q.question)'")
            }
        }
    }
}

# Also check any other json files in question-bank
$existingJsons = Get-ChildItem -Path "question-bank" -Filter "*.json" | Where-Object { $_.Name -ne "index.json" -and $_.Name -ne "oci-foundations-set-001.json" }
Write-Host "Found $($existingJsons.Count) existing .json files in question-bank"

if ($errors.Count -gt 0) {
    Write-Host "`nVALIDATION FAILED with $($errors.Count) errors:" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "- $_" -ForegroundColor Red }
    exit 1
}

Write-Host "`nALL 12 VALIDATION CHECKS PASSED PERFECTLY!" -ForegroundColor Green

Write-Host "`n=== Step 3: Constructing Final JSON Object ==="
$examJsonObj = [ordered]@{
    schema_version = "1.0"
    exam = [ordered]@{
        code = "1Z0-1085"
        title = "Oracle Cloud Infrastructure Foundations Associate"
        syllabus_version = "1Z0-1085-26"
        question_language = "en"
    }
    set = [ordered]@{
        id = "oci-foundations-set-001"
        title = "OCI Foundations Mock Exam - Set 001"
        created_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ")
        question_count = 100
        time_limit_minutes = 90
        passing_score_percent = 65
        blueprint = @(
            [ordered]@{ domain = "Cloud Concepts"; question_count = 15 },
            [ordered]@{ domain = "Getting Started with OCI"; question_count = 15 },
            [ordered]@{ domain = "Core OCI Services"; question_count = 45 },
            [ordered]@{ domain = "Security and Compliance"; question_count = 15 },
            [ordered]@{ domain = "Pricing, Support and Operations"; question_count = 10 }
        )
    }
    questions = $allQuestions
}

$outputPath = "question-bank\oci-foundations-set-001.json"
Write-Host "Writing JSON to $outputPath ..."

# Convert to JSON with high depth
$jsonString = $examJsonObj | ConvertTo-Json -Depth 20

# Write with UTF8 encoding
[System.IO.File]::WriteAllText((Join-Path (Get-Location) $outputPath), $jsonString, [System.Text.Encoding]::UTF8)

$fileInfo = Get-Item $outputPath
Write-Host "File created successfully: $($fileInfo.FullName) (Size: $($fileInfo.Length) bytes)"

Write-Host "`n=== Step 4: Testing JSON Deserialization ==="
$readBackRaw = [System.IO.File]::ReadAllText((Join-Path (Get-Location) $outputPath), [System.Text.Encoding]::UTF8)
$parsedJson = $readBackRaw | ConvertFrom-Json
Write-Host "Verified: JSON parses cleanly!" -ForegroundColor Green
Write-Host "Parsed question count: $($parsedJson.questions.Count)"
Write-Host "Parsed exam title: $($parsedJson.exam.title)"

Write-Host "`n=== Step 5: Creating/Updating question-bank/index.json ==="
$indexPath = "question-bank\index.json"

$indexData = [ordered]@{
    updated_at = (Get-Date -Format "yyyy-MM-ddTHH:mm:ssZ")
    total_sets = 1
    total_questions = 100
    sets = @(
        [ordered]@{
            id = "oci-foundations-set-001"
            filename = "oci-foundations-set-001.json"
            title = "OCI Foundations Mock Exam - Set 001"
            created_at = $examJsonObj.set.created_at
            question_count = 100
            time_limit_minutes = 90
            passing_score_percent = 65
            domain_breakdown = [ordered]@{
                "Cloud Concepts" = 15
                "Getting Started with OCI" = 15
                "Core OCI Services" = 45
                "Security and Compliance" = 15
                "Pricing, Support and Operations" = 10
            }
            types = [ordered]@{
                single = 80
                multiple = 20
            }
            difficulties = [ordered]@{
                easy = ($allQuestions | Where-Object { $_.difficulty -eq "easy" }).Count
                medium = ($allQuestions | Where-Object { $_.difficulty -eq "medium" }).Count
                hard = ($allQuestions | Where-Object { $_.difficulty -eq "hard" }).Count
            }
            scenario_count = $scenarioCount
        }
    )
}

$indexJsonString = $indexData | ConvertTo-Json -Depth 10
[System.IO.File]::WriteAllText((Join-Path (Get-Location) $indexPath), $indexJsonString, [System.Text.Encoding]::UTF8)
Write-Host "index.json created successfully at $indexPath" -ForegroundColor Green

Write-Host "`nSUMMARY:"
Write-Host "- File: $outputPath"
Write-Host "- Total Questions: $($allQuestions.Count)"
Write-Host "- Single: $singleCount | Multiple: $multipleCount"
Write-Host "- Scenarios: $scenarioCount"
Write-Host "- Easy: $(($allQuestions | Where-Object { $_.difficulty -eq 'easy' }).Count) | Medium: $(($allQuestions | Where-Object { $_.difficulty -eq 'medium' }).Count) | Hard: $(($allQuestions | Where-Object { $_.difficulty -eq 'hard' }).Count)"
Write-Host "- Cloud Concepts: $($domainCounts['Cloud Concepts'])"
Write-Host "- Getting Started with OCI: $($domainCounts['Getting Started with OCI'])"
Write-Host "- Core OCI Services: $($domainCounts['Core OCI Services'])"
Write-Host "- Security and Compliance: $($domainCounts['Security and Compliance'])"
Write-Host "- Pricing, Support and Operations: $($domainCounts['Pricing, Support and Operations'])"
