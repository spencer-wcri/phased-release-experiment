param(
    [switch]$watch = $false
)

$workflowFile = "custom-download-build-private-repo.yml"
gh workflow run $workflowFile

if($watch){
    $runId = gh run list -w $workflowFile --json "databaseId,url" -q '.[0].databaseId'
    gh run watch $runId
}
