// To parse this JSON data, do
//
//     final checkQrModel = checkQrModelFromJson(jsonString);

import 'dart:convert';

CheckQrModel checkQrModelFromJson(String str) =>
    CheckQrModel.fromJson(json.decode(str));

String checkQrModelToJson(CheckQrModel data) => json.encode(data.toJson());

class CheckQrModel {
  CheckQrModel({
    required this.status,
    required this.message,
    this.data,
  });

  bool status;
  String message;
  Data? data;

  factory CheckQrModel.fromJson(Map<String, dynamic> json) => CheckQrModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.dataPrintId,
    this.parentId,
    this.serialLevel,
    this.barcode,
    this.serialisasi,
    this.batchNo,
    this.processOrder,
    this.scanned,
    this.product,
    this.nie,
    this.sku,
    this.counter,
    this.berat,
    this.md,
    this.ed,
    this.username,
    this.stationName,
    this.grup,
    this.ipc,
    this.sample,
    this.packer,
    this.uploadLine,
    this.status,
    this.sjp,
  });

  String? id;
  String? dataPrintId;
  String? parentId;
  String? serialLevel;
  String? barcode;
  String? serialisasi;
  String? batchNo;
  String? processOrder;
  DateTime? scanned;
  String? product;
  String? nie;
  String? sku;
  dynamic counter;
  dynamic berat;
  DateTime? md;
  DateTime? ed;
  String? username;
  String? stationName;
  String? grup;
  dynamic ipc;
  dynamic sample;
  dynamic packer;
  DateTime? uploadLine;
  String? status;
  String? sjp;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["ID"],
        dataPrintId: json["Data_Print_ID"],
        parentId: json["Parent_ID"],
        serialLevel: json["Serial_Level"],
        barcode: json["Barcode"],
        serialisasi: json["Serialisasi"],
        batchNo: json["Batch_No"],
        processOrder: json["Process_Order"],
        scanned: DateTime.parse(json["Scanned"]),
        product: json["product"],
        nie: json["nie"],
        sku: json["sku"],
        counter: json["Counter"],
        berat: json["Berat"],
        md: DateTime.parse(json["md"]),
        ed: DateTime.parse(json["ed"]),
        username: json["Username"],
        stationName: json["station_name"],
        grup: json["grup"],
        ipc: json["ipc"],
        sample: json["Sample"],
        packer: json["packer"],
        uploadLine: DateTime.parse(json["upload_line"]),
        status: json["status"],
        sjp: json["sjp"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Data_Print_ID": dataPrintId,
        "Parent_ID": parentId,
        "Serial_Level": serialLevel,
        "Barcode": barcode,
        "Serialisasi": serialisasi,
        "Batch_No": batchNo,
        "Process_Order": processOrder,
        "Scanned": scanned!.toIso8601String(),
        "product": product,
        "nie": nie,
        "sku": sku,
        "Counter": counter,
        "Berat": berat,
        "md": md!.toIso8601String(),
        "ed": ed!.toIso8601String(),
        "Username": username,
        "station_name": stationName,
        "grup": grup,
        "ipc": ipc,
        "Sample": sample,
        "packer": packer,
        "upload_line": uploadLine!.toIso8601String(),
        "status": status,
        "sjp": sjp,
      };
}
