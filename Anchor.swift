// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen


import Foundation
import SolanaSwift
import AnchorKit
import BufferLayoutSwift

struct Escrow {

  fun placeBid(
      bidAmount: UInt64,
      bump: UInt8,
      walletBump: UInt8,
      expiryDate: Int64?,
      bidder: SolanaSDK.PublicKey,
      pdaBidderDataAccount: SolanaSDK.PublicKey,
      pdaBidderDepositAccount: SolanaSDK.PublicKey,
      escrowAccount: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: bidder, isSigner: true, isWritable: true), // bidder
        SolanaSDK.Account.Meta(publicKey: pdaBidderDataAccount, isSigner: false, isWritable: true), // pdaBidderDataAccount
        SolanaSDK.Account.Meta(publicKey: pdaBidderDepositAccount, isSigner: false, isWritable: true), // pdaBidderDepositAccount
        SolanaSDK.Account.Meta(publicKey: escrowAccount, isSigner: false, isWritable: false), // escrowAccount
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "place_bid")

    let bidAmountData = try! bidAmount.serialize()
    let bidAmountBytes = (bidAmountData as BytesEncodable).bytes
    let bumpData = try! bump.serialize()
    let bumpBytes = (bumpData as BytesEncodable).bytes
    let walletBumpData = try! walletBump.serialize()
    let walletBumpBytes = (walletBumpData as BytesEncodable).bytes
    let expiryDateData = try! expiryDate.serialize()
    let expiryDateBytes = (expiryDateData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + bidAmountBytes + bumpBytes + walletBumpBytes + expiryDateBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  fun cancelBid(
      bidder: SolanaSDK.PublicKey,
      pdaBidderDataAccount: SolanaSDK.PublicKey,
      pdaBidderDepositAccount: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: bidder, isSigner: true, isWritable: true), // bidder
        SolanaSDK.Account.Meta(publicKey: pdaBidderDataAccount, isSigner: false, isWritable: true), // pdaBidderDataAccount
        SolanaSDK.Account.Meta(publicKey: pdaBidderDepositAccount, isSigner: false, isWritable: true), // pdaBidderDepositAccount
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: false, isWritable: false), // tokenProgram
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "cancel_bid")

    let instructionData: [UInt8] = sigHash

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  fun acceptBid(
      expectedBidAmount: UInt64,
      initializer: SolanaSDK.PublicKey,
      bidder: SolanaSDK.PublicKey,
      pdaDepositTokenAccount: SolanaSDK.PublicKey,
      pdaBidderDataAccount: SolanaSDK.PublicKey,
      pdaBidderDepositAccount: SolanaSDK.PublicKey,
      escrowAccount: SolanaSDK.PublicKey,
      pdaAccount: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      platformFeesAccount: SolanaSDK.PublicKey,
      metadataAccount: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: initializer, isSigner: true, isWritable: false), // initializer
        SolanaSDK.Account.Meta(publicKey: bidder, isSigner: false, isWritable: true), // bidder
        SolanaSDK.Account.Meta(publicKey: pdaDepositTokenAccount, isSigner: false, isWritable: true), // pdaDepositTokenAccount
        SolanaSDK.Account.Meta(publicKey: pdaBidderDataAccount, isSigner: false, isWritable: true), // pdaBidderDataAccount
        SolanaSDK.Account.Meta(publicKey: pdaBidderDepositAccount, isSigner: false, isWritable: true), // pdaBidderDepositAccount
        SolanaSDK.Account.Meta(publicKey: escrowAccount, isSigner: false, isWritable: true), // escrowAccount
        SolanaSDK.Account.Meta(publicKey: pdaAccount, isSigner: true, isWritable: false), // pdaAccount
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: false, isWritable: false), // tokenProgram
        SolanaSDK.Account.Meta(publicKey: platformFeesAccount, isSigner: false, isWritable: true), // platformFeesAccount
        SolanaSDK.Account.Meta(publicKey: metadataAccount, isSigner: false, isWritable: false), // metadataAccount
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "accept_bid")

    let expectedBidAmountData = try! expectedBidAmount.serialize()
    let expectedBidAmountBytes = (expectedBidAmountData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + expectedBidAmountBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  fun initializeEscrow(
      takerAmount: UInt64,
      initializer: SolanaSDK.PublicKey,
      initializerDepositTokenAccount: SolanaSDK.PublicKey,
      escrowAccount: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: initializer, isSigner: true, isWritable: false), // initializer
        SolanaSDK.Account.Meta(publicKey: initializerDepositTokenAccount, isSigner: false, isWritable: true), // initializerDepositTokenAccount
        SolanaSDK.Account.Meta(publicKey: escrowAccount, isSigner: false, isWritable: true), // escrowAccount
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: true, isWritable: false), // tokenProgram
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "initialize_escrow")

    let takerAmountData = try! takerAmount.serialize()
    let takerAmountBytes = (takerAmountData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + takerAmountBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  fun initializeEscrow2(
      takerAmount: UInt64,
      escrowBump: UInt8,
      initializer: SolanaSDK.PublicKey,
      initializerDepositTokenAccount: SolanaSDK.PublicKey,
      escrowAccount: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: initializer, isSigner: true, isWritable: false), // initializer
        SolanaSDK.Account.Meta(publicKey: initializerDepositTokenAccount, isSigner: false, isWritable: true), // initializerDepositTokenAccount
        SolanaSDK.Account.Meta(publicKey: escrowAccount, isSigner: false, isWritable: true), // escrowAccount
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: false, isWritable: false), // tokenProgram
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "initialize_escrow2")

    let takerAmountData = try! takerAmount.serialize()
    let takerAmountBytes = (takerAmountData as BytesEncodable).bytes
    let escrowBumpData = try! escrowBump.serialize()
    let escrowBumpBytes = (escrowBumpData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + takerAmountBytes + escrowBumpBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  fun cancelEscrow(
      initializer: SolanaSDK.PublicKey,
      pdaDepositTokenAccount: SolanaSDK.PublicKey,
      pdaAccount: SolanaSDK.PublicKey,
      escrowAccount: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: initializer, isSigner: true, isWritable: false), // initializer
        SolanaSDK.Account.Meta(publicKey: pdaDepositTokenAccount, isSigner: false, isWritable: true), // pdaDepositTokenAccount
        SolanaSDK.Account.Meta(publicKey: pdaAccount, isSigner: false, isWritable: false), // pdaAccount
        SolanaSDK.Account.Meta(publicKey: escrowAccount, isSigner: false, isWritable: true), // escrowAccount
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: false, isWritable: false), // tokenProgram
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "cancel_escrow")

    let instructionData: [UInt8] = sigHash

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  fun exchange2(
      expectedTakerAmount: UInt64,
      expectedMint: SolanaSDK.PublicKey,
      taker: SolanaSDK.PublicKey,
      pdaDepositTokenAccount: SolanaSDK.PublicKey,
      initializerMainAccount: SolanaSDK.PublicKey,
      escrowAccount: SolanaSDK.PublicKey,
      pdaAccount: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      platformFeesAccount: SolanaSDK.PublicKey,
      metadataAccount: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: taker, isSigner: true, isWritable: false), // taker
        SolanaSDK.Account.Meta(publicKey: pdaDepositTokenAccount, isSigner: false, isWritable: true), // pdaDepositTokenAccount
        SolanaSDK.Account.Meta(publicKey: initializerMainAccount, isSigner: false, isWritable: true), // initializerMainAccount
        SolanaSDK.Account.Meta(publicKey: escrowAccount, isSigner: false, isWritable: true), // escrowAccount
        SolanaSDK.Account.Meta(publicKey: pdaAccount, isSigner: false, isWritable: false), // pdaAccount
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: false, isWritable: false), // tokenProgram
        SolanaSDK.Account.Meta(publicKey: platformFeesAccount, isSigner: false, isWritable: true), // platformFeesAccount
        SolanaSDK.Account.Meta(publicKey: metadataAccount, isSigner: false, isWritable: false), // metadataAccount
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "exchange2")

    let expectedTakerAmountData = try! expectedTakerAmount.serialize()
    let expectedTakerAmountBytes = (expectedTakerAmountData as BytesEncodable).bytes
    let expectedMintData = try! expectedMint.serialize()
    let expectedMintBytes = (expectedMintData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + expectedTakerAmountBytes + expectedMintBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  fun exchange(
      taker: SolanaSDK.PublicKey,
      pdaDepositTokenAccount: SolanaSDK.PublicKey,
      initializerMainAccount: SolanaSDK.PublicKey,
      escrowAccount: SolanaSDK.PublicKey,
      pdaAccount: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      platformFeesAccount: SolanaSDK.PublicKey,
      metadataAccount: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: taker, isSigner: true, isWritable: false), // taker
        SolanaSDK.Account.Meta(publicKey: pdaDepositTokenAccount, isSigner: false, isWritable: true), // pdaDepositTokenAccount
        SolanaSDK.Account.Meta(publicKey: initializerMainAccount, isSigner: false, isWritable: true), // initializerMainAccount
        SolanaSDK.Account.Meta(publicKey: escrowAccount, isSigner: false, isWritable: true), // escrowAccount
        SolanaSDK.Account.Meta(publicKey: pdaAccount, isSigner: false, isWritable: false), // pdaAccount
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: false, isWritable: false), // tokenProgram
        SolanaSDK.Account.Meta(publicKey: platformFeesAccount, isSigner: false, isWritable: true), // platformFeesAccount
        SolanaSDK.Account.Meta(publicKey: metadataAccount, isSigner: false, isWritable: false), // metadataAccount
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "exchange")

    let instructionData: [UInt8] = sigHash

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  public struct BidAccount: DecodableBufferLayout {
    let anchorAccountBuffer: Int64
    let bidderKey: SolanaSDK.PublicKey
    let bidAmount: UInt64
    let escrowKey: SolanaSDK.PublicKey
    let bump: UInt8
    let walletBump: UInt8
    let initializerKey: SolanaSDK.PublicKey
    let initializerDepositTokenAccount: SolanaSDK.PublicKey
    let expiryDate: Int64?

    public static var optionalPropertyNames: [String] = ["expiryDate"]
  }
  public struct EscrowAccount: DecodableBufferLayout {
    let anchorAccountBuffer: Int64
    let initializerKey: SolanaSDK.PublicKey
    let initializerDepositTokenAccount: SolanaSDK.PublicKey
    let takerAmount: UInt64

    public static var optionalPropertyNames: [String] = []
  }
}
  