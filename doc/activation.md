# Acquiring an activation file

Create a file called `.github/workflows/activation.yml` and add the below workflow definition to it:

```yml
name: Acquire activation file
on:
  workflow_dispatch: {}
jobs:
  activation:
    name: Request manual activation file 🔑
    runs-on: ubuntu-latest
    steps:
      # Request manual activation file
      - name: Request manual activation file
        id: getManualLicenseFile
        uses: game-ci/unity-request-activation-file@v2
      # Upload artifact (Unity_v20XX.X.XXXX.alf)
      - name: Expose as artifact
        uses: actions/upload-artifact@v3
        with:
          name: ${{ steps.getManualLicenseFile.outputs.filePath }}
          path: ${{ steps.getManualLicenseFile.outputs.filePath }}
```

Commit and push your workflow definition.


# Converting into a license

Follow these (one-time) steps for simple activation.

1. [Manually run](https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow) the above workflow.

2. Download the manual activation file that now appeared as an artifact and extract the `Unity_v20XX.X.XXXX.alf` file from the zip.

3. Visit [license.unity3d.com](https://license.unity3d.com) and upload the `Unity_v20XX.X.XXXX.alf` file.

4. You should now receive your license file (Unity_v20XX.x.ulf) as a download. It's ok if the numbers don't match your Unity version exactly.

5. Open Github > Your repository > Settings > Secrets.

6. Create the following secrets;
    * `UNITY_LICENSE` - (Copy the contents of your license file into here)


## Flow

alf > ulf > Gihub Secret - UNITY_LICENSE