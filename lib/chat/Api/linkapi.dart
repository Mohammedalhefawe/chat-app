
class AppLink {
  static const String server = "http://192.168.2.45:8000/api";
  static const String imagesServer = "http://192.168.2.45:8000/storage";
//================================================================
//   static String token =
//       'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjBmN2FjNWNmNDlhOGQ2ZmYxOWYzMmQ3NTMxYjI1NDNmZGExMTNmZTM5YzI2NThmMWRjYmMwYThiZjc5MzZkYjgwMzY2YmI2ZTY1YmVmYjYiLCJpYXQiOjE3MjI4NTE0MzMuNzI3Mzc5LCJuYmYiOjE3MjI4NTE0MzMuNzI3MzgzLCJleHAiOjE3NTQzODc0MzMuNjY2Njk1LCJzdWIiOiI1Iiwic2NvcGVzIjpbXX0.lK_mqF6hE_BOSNq5Zl8KqwayPpgJTTS4WTJjQ8W1vgjh917gYGf7frMpurUts6nHUNtGSpdHr9OD9Ca0IF3eHaLfxugfaGBhNTQ_QMdpelxqOUd2xmwsjuj6W3lcTcwtIIRO48ltOfkfaCeqJY-bLqD2wbw_FQUZUBCyjxyaALQnvodcJMXsJ0B3Ysp62R8Puv_2BqI22SFLV3im3_vNTN8KyXfFi50Jbp5VePkxFSUDO3jnKpCZQGbOVSHXVVPn7HbzjiZDTTugiwfdZR87QsQMov_3rRMGghdOYzULMWBheezCWlWy0DwK0W1eAf_VxEzwC3u3NUir9CyeksR0w08oreEwYdbepdURhT2oIJ3GBGzUv6Nm1vsmbXwejAIqS266LOovmIvefvOKwjr9ein5pHzdDzN29BmntKNuyY2ABINHoVJnGTtfDXtK3dxB4uPmWSdB91Mykn8BCKvMLX7p20bTJNSVtmQZ7gbjxbbHdjKe7XBoadQjxyA67GdwXBt2ImCig2hqhqPV5ohlpIdnpteI_uB9R76AwSqXJoMpmLzFxoWHkSfLg5ybylnzjNIEHPXYdUp_CAWWrc-hWA3qIEujaj2BMQnTcNhEXSNwDraADEu6nChZjhVXZGlbC9gtjkl-44muOfhn5yPow-_lqETyZzpzimyIwzKedc8';
//   static String token=  CachData.getData(key: 'access_token');
  static String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDExZGY2M2E2Y2Q0NWY2ZjkzMTdkOWI0M2M0MTA2YTY3ZmFlZjhlNDVhOWMyYjZhNGEyNWJlYjQ4MGFhYWU1YWVjOWJkMWUzYTYxYWQ2YzMiLCJpYXQiOjE3MjM2MjU0NDEuNzcyMTEsIm5iZiI6MTcyMzYyNTQ0MS43NzIxMTMsImV4cCI6MTc1NTE2MTQ0MS43NDk4MDYsInN1YiI6IjkiLCJzY29wZXMiOltdfQ.Gz3BuBvilY8qaXsjSWsySrjJsdZvY-VtYTshz_c59P9wqJIXLTxnzegc7T2VlL5c_TOi1jkHA1xFPrOcFLQXbQRSUiIFRdNBj9JtBOxVDD2uZdLRmoN2n-exv0_3b37VF9StDzFfzrdcpiHGxWYojBz2wJBhAY4u4wm1latoxXrfA7vtZKmDYEZSmV3qKWka4nvvdeXNaZZX8yzyyzbo65rUgCJMLgV2UJDg5XkPNKceaE6VkoR_cHV1JZh9T1r9gk0j_0mk4TH2Hxvf7cLtmHsJuy5on0lLQrO_LhQhQmENxpKumQfMMFTqIq6DL8yxKgqaR8tXpi2F5Da3n-Kv42nD4Q79Mazm-ZV_-3xOpi0VuyzEbMSKhmo87duHlXwbdDkZAosJGgcbiuHA7FuAedIXEGe-PBVudC0BXdQ6TDN6mY0MnC5kY3zeEJjICMOapAccdiFJqCfVUZ3wlXZKRoag01lyrHQMONmRJDf9gnQF9L83XxmA5okwhf32dumtm0bDlN-XdjtGsrS9SegVXbCVi3z3G_CAdremZNh5kSkqD0xN62iCNAkaqt8CX5LbEDCoib5F5l_NRUOUsxIndjbkpFFsu2Th_mDkJKsTBWxmEolNGJP0Z1TBKSzMAhz3pcv2BTxI2h4qETeN-2HOZOjN6a-76wWNYykQKHV7cLU';
  static String myId = '9';
  // static String myId=  CachData.getData(key: 'user_id');
  //
  static const String sendMsg = "$server/message";
  static const String getAllMsg = "$server/message";
  static const String getAllChats = "$server/chat";
  static const String addChat = "$server/chat";
}
