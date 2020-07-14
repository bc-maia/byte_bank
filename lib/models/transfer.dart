class Transfer {
  final int account;
  final double amount;
  final String description;

  Transfer(
    this.account,
    this.amount,
    this.description,
  );

  @override
  String toString() {
    return 'account: $account, value: $amount, description: $description';
  }
}
