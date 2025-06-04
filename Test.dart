enum ApplicationStatus {
    accepted,
    rejected,
    failed,
}
List<List<int>> listevon = [[]];
void main() {
  ApplicationStatus appStatus = ApplicationStatus.failed;
  
  if(appStatus == ApplicationStatus.failed)
  {
    print("fehler!");
  }  
}