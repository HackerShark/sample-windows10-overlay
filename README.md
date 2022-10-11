# sample-windows10-overlay

Sample overlay for the baseline InSpec profile at https://github.com/mitre/microsoft-windows-10-stig-baseline with modifications based Our Project's different policy compliance baseline requirements. The baseline InSpec profile is used validate the secure configuration of Microsoft Windows 10 Security Technical Implementation Guide (STIG) Version 1, Release 20.

The original baseline InSpec profile is used validate the secure configuration of Microsoft Windows 10 Security Technical Implementation Guide (STIG) Version 1, Release 20.

This Overlay profile clearly distinguishes and measures to OUR policy requirements without modification to the baseline profile or misrepresentation that we are exactly compliant with the original STIG. This overlay allows us to show compliance with our own vetted requirements.

## Getting Started  
It is intended and recommended that InSpec and this profile overlay be run from a __"runner"__ host (such as a DevOps orchestration server, an administrative management system, or a developer's workstation/laptop) against the target remotely over __winrm__.

__For the best security of the runner, always install on the runner the _latest version_ of InSpec and supporting Ruby language components.__ 

Latest versions and installation options are available at the [InSpec](http://inspec.io/) site.

## Tailoring to Your Environment

The following inputs may be configured in an inputs ".yml" file for the profile to run correctly for your specific environment. More information about InSpec inputs can be found in the [InSpec Profile Documentation](https://www.inspec.io/docs/reference/profiles/).

```
min_pass_len: 32
```

## Running This Overlay Directly from Github

Against a remote target using winrm
```bash
# How to run
inspec exec https://github.com/mitre/microsoft-windows-10-stig-baseline/archive/master.tar.gz --target winrm://<hostip> --user '<admin-account>' --password=<password> --input-file=<path_to_your_inputs_file/name_of_your_inputs_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json>
```
### Different Run Options

  [Full exec options](https://docs.chef.io/inspec/cli/#options-3)

## Running This Overlay from a local Archive copy
If your runner is not always expected to have direct access to GitHub, use the following steps to create an archive bundle of this overlay and all of its dependent tests:

(Git is required to clone the InSpec profile using the instructions below. Git can be downloaded from the [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) site.) 

```
mkdir profiles
cd profiles
git clone https://github.com/mitre/sample-windows10-overlay.git
inspec archive sample-windows10-overlay
sudo inspec exec <name of generated archive> --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

For every successive run, follow these steps to always have the latest version of this overlay and dependent profiles:

```
cd sample-windows10-overlay
git pull
cd ..
inspec archive sample-windows10-overlay --overwrite
sudo inspec exec <name of generated archive> --input-file <path_to_your_input_file/name_of_your_input_file.yml> --reporter=cli json:<path_to_your_output_file/name_of_your_output_file.json> 
```

## Using Heimdall for Viewing the JSON Results

The JSON results output file can be loaded into __[heimdall-lite](https://heimdall-lite.mitre.org/)__ for a user-interactive, graphical view of the InSpec results. 

The JSON InSpec results file may also be loaded into a __[full heimdall server](https://github.com/mitre/heimdall)__, allowing for additional functionality such as to store and compare multiple profile runs.

## Authors


## Special Thanks
* Eugene Aronne

## Contributing and Getting Help
To report a bug or feature request, please open an [issue](https://github.com/mitre/sample-windows10-overlay/issues/new).

## License
This is licensed under the [Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0) license. 

### NOTICE
DISA STIGs are published by DISA IASE, see: https://iase.disa.mil/Pages/privacy_policy.aspx
