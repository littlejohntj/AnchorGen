// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen


import Foundation
import SolanaSwift
import AnchorKit
import BufferLayoutSwift

struct NftCandyMachineV2 {

  static func mintNft(
      creatorBump: UInt8,
      candyMachine: SolanaSDK.PublicKey,
      candyMachineCreator: SolanaSDK.PublicKey,
      payer: SolanaSDK.PublicKey,
      wallet: SolanaSDK.PublicKey,
      metadata: SolanaSDK.PublicKey,
      mint: SolanaSDK.PublicKey,
      mintAuthority: SolanaSDK.PublicKey,
      updateAuthority: SolanaSDK.PublicKey,
      masterEdition: SolanaSDK.PublicKey,
      tokenMetadataProgram: SolanaSDK.PublicKey,
      tokenProgram: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      rent: SolanaSDK.PublicKey,
      clock: SolanaSDK.PublicKey,
      recentBlockhashes: SolanaSDK.PublicKey,
      instructionSysvarAccount: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: candyMachine, isSigner: false, isWritable: true), // candyMachine
        SolanaSDK.Account.Meta(publicKey: candyMachineCreator, isSigner: false, isWritable: false), // candyMachineCreator
        SolanaSDK.Account.Meta(publicKey: payer, isSigner: true, isWritable: false), // payer
        SolanaSDK.Account.Meta(publicKey: wallet, isSigner: false, isWritable: true), // wallet
        SolanaSDK.Account.Meta(publicKey: metadata, isSigner: false, isWritable: true), // metadata
        SolanaSDK.Account.Meta(publicKey: mint, isSigner: false, isWritable: true), // mint
        SolanaSDK.Account.Meta(publicKey: mintAuthority, isSigner: true, isWritable: false), // mintAuthority
        SolanaSDK.Account.Meta(publicKey: updateAuthority, isSigner: true, isWritable: false), // updateAuthority
        SolanaSDK.Account.Meta(publicKey: masterEdition, isSigner: false, isWritable: true), // masterEdition
        SolanaSDK.Account.Meta(publicKey: tokenMetadataProgram, isSigner: false, isWritable: false), // tokenMetadataProgram
        SolanaSDK.Account.Meta(publicKey: tokenProgram, isSigner: false, isWritable: false), // tokenProgram
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
        SolanaSDK.Account.Meta(publicKey: rent, isSigner: false, isWritable: false), // rent
        SolanaSDK.Account.Meta(publicKey: clock, isSigner: false, isWritable: false), // clock
        SolanaSDK.Account.Meta(publicKey: recentBlockhashes, isSigner: false, isWritable: false), // recentBlockhashes
        SolanaSDK.Account.Meta(publicKey: instructionSysvarAccount, isSigner: false, isWritable: false), // instructionSysvarAccount
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "mint_nft")

    let creatorBumpData = try! creatorBump.serialize()
    let creatorBumpBytes = (creatorBumpData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + creatorBumpBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  static func updateCandyMachine(
      data: CandyMachineData,
      candyMachine: SolanaSDK.PublicKey,
      authority: SolanaSDK.PublicKey,
      wallet: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: candyMachine, isSigner: false, isWritable: true), // candyMachine
        SolanaSDK.Account.Meta(publicKey: authority, isSigner: true, isWritable: false), // authority
        SolanaSDK.Account.Meta(publicKey: wallet, isSigner: false, isWritable: false), // wallet
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "update_candy_machine")

    let dataData = try! data.serialize()
    let dataBytes = (dataData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + dataBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  static func addConfigLines(
      index: UInt32,
      configLines: [ConfigLine],
      candyMachine: SolanaSDK.PublicKey,
      authority: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: candyMachine, isSigner: false, isWritable: true), // candyMachine
        SolanaSDK.Account.Meta(publicKey: authority, isSigner: true, isWritable: false), // authority
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "add_config_lines")

    let indexData = try! index.serialize()
    let indexBytes = (indexData as BytesEncodable).bytes
    let configLinesData = try! configLines.serialize()
    let configLinesBytes = (configLinesData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + indexBytes + configLinesBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  static func initializeCandyMachine(
      data: CandyMachineData,
      candyMachine: SolanaSDK.PublicKey,
      wallet: SolanaSDK.PublicKey,
      authority: SolanaSDK.PublicKey,
      payer: SolanaSDK.PublicKey,
      systemProgram: SolanaSDK.PublicKey,
      rent: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: candyMachine, isSigner: false, isWritable: true), // candyMachine
        SolanaSDK.Account.Meta(publicKey: wallet, isSigner: false, isWritable: false), // wallet
        SolanaSDK.Account.Meta(publicKey: authority, isSigner: false, isWritable: false), // authority
        SolanaSDK.Account.Meta(publicKey: payer, isSigner: true, isWritable: false), // payer
        SolanaSDK.Account.Meta(publicKey: systemProgram, isSigner: false, isWritable: false), // systemProgram
        SolanaSDK.Account.Meta(publicKey: rent, isSigner: false, isWritable: false), // rent
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "initialize_candy_machine")

    let dataData = try! data.serialize()
    let dataBytes = (dataData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + dataBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  static func updateAuthority(
      newAuthority: SolanaSDK.PublicKey?,
      candyMachine: SolanaSDK.PublicKey,
      authority: SolanaSDK.PublicKey,
      wallet: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: candyMachine, isSigner: false, isWritable: true), // candyMachine
        SolanaSDK.Account.Meta(publicKey: authority, isSigner: true, isWritable: false), // authority
        SolanaSDK.Account.Meta(publicKey: wallet, isSigner: false, isWritable: false), // wallet
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "update_authority")

    let newAuthorityData = try! newAuthority.serialize()
    let newAuthorityBytes = (newAuthorityData as BytesEncodable).bytes
    let instructionData: [UInt8] = sigHash + newAuthorityBytes

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

  static func withdrawFunds(
      candyMachine: SolanaSDK.PublicKey,
      authority: SolanaSDK.PublicKey,
      programId: SolanaSDK.PublicKey
  ) -> SolanaSDK.TransactionInstruction { 
    let keys = [
        SolanaSDK.Account.Meta(publicKey: candyMachine, isSigner: false, isWritable: true), // candyMachine
        SolanaSDK.Account.Meta(publicKey: authority, isSigner: true, isWritable: false), // authority
    ]

    let sigHash: [UInt8] = AnchorKit.sighash(nameSpace: "global", name: "withdraw_funds")

    let instructionData: [UInt8] = sigHash

    return SolanaSDK.TransactionInstruction(keys: keys, programId: programId, data: instructionData)
  }

    public struct CandyMachine: DecodableBufferLayout {
    let anchorAccountBuffer: Int64
    let authority: SolanaSDK.PublicKey
    let wallet: SolanaSDK.PublicKey
    let tokenMint: SolanaSDK.PublicKey?
    let itemsRedeemed: UInt64
    let data: CandyMachineData
  }
  public struct WhitelistMintSettings: DecodableBufferLayout {
    let mode: WhitelistMintMode
    let mint: SolanaSDK.PublicKey
    let presale: Bool
    let discountPrice: UInt64?
  }

  public struct CandyMachineData: DecodableBufferLayout {
    let uuid: String
    let price: UInt64
    let symbol: String
    let sellerFeeBasisPoints: UInt16
    let maxSupply: UInt64
    let isMutable: Bool
    let retainAuthority: Bool
    let goLiveDate: Int64?
    let endSettings: EndSettings?
    let creators: [Creator]
    let hiddenSettings: HiddenSettings?
    let whitelistMintSettings: WhitelistMintSettings?
    let itemsAvailable: UInt64
    let gatekeeper: GatekeeperConfig?
  }

  public struct GatekeeperConfig: DecodableBufferLayout {
    let gatekeeperNetwork: SolanaSDK.PublicKey
    let expireOnUse: Bool
  }

  public struct EndSettings: DecodableBufferLayout {
    let endSettingType: EndSettingType
    let number: UInt64
  }

  public struct HiddenSettings: DecodableBufferLayout {
    let name: String
    let uri: String
    let hash: [UInt8]
  }

  public struct ConfigLine: DecodableBufferLayout {
    let name: String
    let uri: String
  }

  public struct Creator: DecodableBufferLayout {
    let address: SolanaSDK.PublicKey
    let verified: Bool
    let share: UInt8
  }

  public enum WhitelistMintMode {
    case BurnEveryTime
    case NeverBurn
  }

  public enum EndSettingType {
    case Date
    case Amount
  }

}
  