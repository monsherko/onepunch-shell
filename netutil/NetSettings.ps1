function use_any_ssl_protocol() {
     $original = "$([System.Net.ServicePointManager]::SecurityProtocol)"
     $available = [string]::join(', ', [Enum]::GetNames([System.Net.SecurityProtocolType]))


     set_https_protocols $available

     return $original
 }

 function set_ssl_version_protocols($protocols) {
     try {
         [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType] $protocols
     } catch {
         [System.Net.ServicePointManager]::SecurityProtocol = "Tls,Tls11,Tls12"
     }
 }
