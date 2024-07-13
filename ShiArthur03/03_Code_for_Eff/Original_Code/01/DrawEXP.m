close all; clc; clear all;
Test2ILVDC=csvread("Test2-ILVDC.csv",10,0);
Test2ILVDC(:,1)=Test2ILVDC(:,1)-Test2ILVDC(1,1);

Test2ILVDC2 = smoothdata(Test2ILVDC,'gaussian',1000);

Test1IHVDC=csvread("Test1-IHVDC.csv",10,0);
Test1IHVDC(:,1)=Test1IHVDC(:,1)-Test1IHVDC(1,1);

Test2IC1=csvread("Test2-IC1.csv",10,0);
Test2IC1(:,1)=Test2IC1(:,1)-Test2IC1(1,1);

Test2YBLVDC=csvread("Test2-YBLVDC.csv",10,0);
Test2YBLVDC(:,1)=Test2YBLVDC(:,1)-Test2YBLVDC(1,1);

Test2IHVAC1=csvread("Test2-IHVAC1.csv",10,0);
Test2IHVAC1(:,1)=Test2IHVAC1(:,1)-Test2IHVAC1(1,1);

