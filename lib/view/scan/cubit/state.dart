abstract class ScannerStates{}
 class InitScannerState extends ScannerStates{}
 class SuccessScannerState extends ScannerStates{}
 class ErrorScannerState extends ScannerStates{
 String error;
 ErrorScannerState(this.error);
 }

class LoadingBlogsState extends ScannerStates{}
class SuccessBlogsState extends ScannerStates{}
class ErrorBlogsState extends ScannerStates{
 String error;
 ErrorBlogsState(this.error);
}