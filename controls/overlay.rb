include_controls 'microsoft-windows-10-stig-baseline' do

    control 'V-63319' do
        impact 0.0
        desc "check", "Verify domain-joined systems are using Windows 10 Enterprise
        Edition 32-bit version.
        For standalone systems, this is NA.
        Open \"Settings\".
        Select \"System\", then \"About\".
        If \"Edition\" is not \"Windows 10 Enterprise\", this is a finding.
        If \"System type\" is not \"32-bit operating system…\", this is a finding."
        desc "fix", 'Use Windows 10 Enterprise 32-bit version for domain-joined systems.'
    end

    control 'V-63499' do
        impact 0.0
        desc 'caveat', 'This is Not Applicable for our project since we have an approved risk-based decision on 10/1/2021 allowing relaxing this requirement.'
        describe 'This is Not Applicable for our project since we have an approved risk-based decision on 10/1/2021 allowing relaxing this requirement.' do
          skip 'This is Not Applicable for our project since we have an approved risk-based decision on 10/1/2021 allowing relaxing this requirement.'
        end
    end
    
    control 'V-63423' do
      title 'Passwords must, at a minimum, be 32 characters.'
      desc  'check', "
        Verify the effective setting in Local Group Policy Editor.
      Run \"gpedit.msc\".
      Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings
      >> Security Settings >> Account Policies >> Password Policy.
      If the value for the \"Minimum password length,\" is less than #{input('min_pass_len')}
      characters, this is a finding.
      "
      desc 'fix', "
        Configure the policy value for Computer Configuration >> Windows
      Settings >> Security Settings >> Account Policies >> Password Policy >>
      \"Minimum password length\" to #{input('min_pass_len')} characters.
      "
    end

end
