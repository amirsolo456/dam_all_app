#Get-ChildItem -Directory -Recurse -Depth 5 |
#     Sort-Object FullName |
#     ForEach-Object {
#
#         $depth = ($_.PSPath -split '\\').Count - 5
#         '  ' * $depth + $_.Name + '/'
#     }