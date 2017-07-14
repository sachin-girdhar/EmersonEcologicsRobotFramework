*** Settings ***
Documentation       Shared HTTP Status Codes Variables List
###### External Libraries ######


*** Variables ***
###### HTTP Status Codes Shared Variables ######
#1×× Informational
${http_100_code}    100  #Continue
${http_101_code}    101  #Switching Protocols
${http_102_code}    102  #Processing
#2×× Success
${http_200_code}    200  #OK
${http_201_code}    201  #Created
${http_202_code}    202  #Accepted
${http_203_code}    203  #Non-authoritative Information
${http_204_code}    204  #No Content
${http_205_code}    205  #Reset Content
${http_206_code}    206  #Partial Content
${http_207_code}    207  #Multi-Status
${http_208_code}    208  #Already Reported
${http_209_code}    226  #IM Used
#3×× Redirection
${http_300_code}    300  #Multiple Choices
${http_301_code}    301  #Moved Permanently
${http_302_code}    302  #Found
${http_303_code}    303  #See Other
${http_304_code}    304  #Not Modified
${http_305_code}    305  #Use Proxy
${http_306_code}    307  #Temporary Redirect
${http_307_code}    308  #Permanent Redirect
#4×× Client Error
${http_400_code}    400  #Bad Request
${http_401_code}    401  #Unauthorized
${http_402_code}    402  #Payment Required
${http_403_code}    403  #Forbidden
${http_404_code}    404  #Not Found
${http_405_code}    405  #Method Not Allowed
${http_406_code}    406  #Not Acceptable
${http_407_code}    407  #Proxy Authentication Required
${http_408_code}    408  #Request Timeout
${http_409_code}    409  #Conflict
${http_410_code}    410  #Gone
${http_411_code}    411  #Length Required
${http_412_code}    412  #Precondition Failed
${http_413_code}    413  #Payload Too Large
${http_414_code}    414  #Request-URI Too Long
${http_415_code}    415  #Unsupported Media Type
${http_416_code}    416  #Requested Range Not Satisfiable
${http_417_code}    417  #Expectation Failed
${http_418_code}    418  #I'm a teapot
${http_421_code}    421  #Misdirected Request
${http_422_code}    422  #Unprocessable Entity
${http_423_code}    423  #Locked
${http_424_code}    424  #Failed Dependency
${http_426_code}    426  #Upgrade Required
${http_428_code}    428  #Precondition Required
${http_429_code}    429  #Too Many Requests
${http_431_code}    431  #Request Header Fields Too Large
${http_444_code}    444  #Connection Closed Without Response
${http_451_code}    451  #Unavailable For Legal Reasons
${http_499_code}    499  #Client Closed Request
#5×× Server Error
${http_500_code}    500  #Internal Server Error
${http_501_code}    501  #Not Implemented
${http_502_code}    502  #Bad Gateway
${http_503_code}    503  #Service Unavailable
${http_504_code}    504  #Gateway Timeout
${http_505_code}    505  #HTTP Version Not Supported
${http_506_code}    506  #Variant Also Negotiates
${http_507_code}    507  #Insufficient Storage
${http_508_code}    508  #Loop Detected
${http_510_code}    510  #Not Extended
${http_511_code}    511  #Network Authentication Required
${http_599_code}    599  #Network Connect Timeout Error