# Coding Spike

Internal wallet transactional system (with a frontend).

Requirements:
  * Based on relationships every entity e.g. User, Team, Stock or any other 
    should have their own defined "wallet" to which we could transfer money or 
    withdraw
  * Every request for credit/debit (deposit or withdraw) should be based on 
    records in database for given model
  * Every instance of a single transaction should have proper validations against 
    required fields and their source and targetwallet, e.g. from who we are taking 
    money and transferring to whom? (Credits == source wallet == nil, Debits == 
    targetwallet == nil)
  * Each record should be created in database transactions to comply with ACID 
    standards
  * Balance for given entity (User, Team, Stock) should be calculated by summing 
    records

Tasks:
- [x] App initialize.
- [x] Initialize testing environment rspec/guard.
- [x] Creating models and relations:
  * Users, Stocks and Teams: with a name (required) and one wallet.
  * Wallet: have many transactions. It will be wallatable polymorphic association, 
    which implements STI pattern in Rails.
  * Transactions: with source, target and amount(required). Belongs to Wallet.
- [ ] Create proper calculations:
  * Transaction kinds and Wallet actions:
    * Deposit: Amount without source wallet
    * Withdraw: Amount without target wallet
    * Transfer: Amount with source/target wallet
  * Wallet Balance is target_transactions minus source_transactions. And zero if
    no transactions.
  * Transaction validations:
    * Before create transaction: amount should be minor or equal to source wallet
      actual balance
    * Amount should be bigger than 0
  * On Users/Stocks/Teams creation wallet should be created.
- [ ] Initialize frontend with Stimulusjs, Bootstrap and FontAwesome.
- [ ] Front end: View and actions
  * Wallet:
    * List owners.
    * Create Owner: Creates Users/Stocks/Teams with name.
    * Show: balance and transactions.
  * Transaction: Deposit/Withdraw/Transfer.
