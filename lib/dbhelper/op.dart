void mockUpdateAppointmentStatus(bool isUnavailable) {
  
  print("Mocking database update: $isUnavailable");
}

Future<void> updateAppointmentStatus(String id, bool available) async {
  // Your logic to update the appointment status in the database
  // This is just a placeholder. Replace it with actual database operation.
  print("Updating status for $id to $available");
}