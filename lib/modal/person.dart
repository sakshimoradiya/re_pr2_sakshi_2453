class PersonModal {
  String emailId;
  String password;

  PersonModal(
      this.emailId,
      this.password, String name,
      );

  factory PersonModal.fromMap({required Map data}) {
    return PersonModal(
      data['emailId'],

      data['password'],
      data['name']

    );
  }
}
