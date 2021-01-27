import 'package:flutter_vendor_ui/model/contract_model.dart';

List<Contract> contractList = [
  Contract(
      contractNumber: 'CNTR_1',
      title: 'Hop dong cung cap vat tu',
      contract: 'New',
      vendor: 'Phong Vu',
      type: 'Lease',
      status: 'Current',
      amount: '150.000.000',
      startDate: '9/1/2020',
      endDate: '9/1/2022',
      product: 'Computer',
      checkBox: false,
      editDate: '18/01/2021',
      editContent: 'Gia hạn hợp đồng cung cấp'),
  Contract(
      contractNumber: 'CNTR_2',
      title: 'Hop dong cung cap vat tu',
      contract: 'New',
      vendor: 'ABC',
      type: 'Lease',
      status: 'Current',
      amount: '300.000.000',
      startDate: '4/11/2021',
      endDate: '15/8/2022',
      product: 'Computer',
      checkBox: false,
      editDate: '18/01/2021',
      editContent: 'Thay đổi chi phí cung cấp sản phẩm'),
];

List<Contract> contractPrintList = [];