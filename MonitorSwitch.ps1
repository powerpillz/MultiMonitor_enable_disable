Add-Type -assembly System.Windows.Forms

$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Monitor Switch Tool'
$main_form.Width = 300
$main_form.Height = 100
$main_form.AutoSize = $true


$label1 = New-Object System.Windows.Forms.Label
$label1.Text = 'Second Display Control'
$label1.Location = New-Object System.Drawing.Point(0,5)
$label1.AutoSize = $true
$main_form.Controls.Add($label1)

$button_off = New-Object System.Windows.Forms.Button
$button_off.Text = 'DISABLE'
$button_off.ForeColor = [System.Drawing.Color]::Black
$button_off.Location = New-Object System.Drawing.Point(0, 30)
$button_off.Size = New-Object System.Drawing.Size(60, 20)
$button_off.Add_Click(
    {
        .\MultiMonitorTool.exe /disable \\.\DISPLAY2
        $button_off.ForeColor = [System.Drawing.Color]::Red
        $button_on.ForeColor = [System.Drawing.Color]::Black
    }
)
$main_form.Controls.Add($button_off)

$button_on = New-Object System.Windows.Forms.Button
$button_on.Text = 'ENABLE'
$button_on.ForeColor = [System.Drawing.Color]::Red
$button_on.Location = New-Object System.Drawing.Point(65, 30)
$button_on.Size = New-Object System.Drawing.Size(60, 20)
$button_on.Add_Click(
    {
        .\MultiMonitorTool.exe /enable \\.\DISPLAY2
        $button_on.ForeColor = [System.Drawing.Color]::Red
        $button_off.ForeColor = [System.Drawing.Color]::Black
    }
)
$main_form.Controls.Add($button_on)


$main_form.ShowDialog()