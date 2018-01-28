{File : tubes.pas}
{Desc : Pengelolaan Master Jadwal Penerbangan}
{Date : 30 Maret 2016}
program tubes;
uses crt;
Type
        jam   = record
         h    : string;
         m    : string;
        end;
        login = record
         usrnm  : string;
         psswrd : string;
        end;
        jadwal = record
         kode   : string;
         tggl   : string;
         waktu  : jam;
         rute   : string;
         kuota  : integer;
        end;
        data = array [1..5] of jadwal;
        user = array [1..5] of login;
var
        yesno           :string;
        nmr,i           :integer;
        pngguna         :string;
        simpan          :user;
        datapengguna    :login;
        cekcek          :boolean;
        J               :data;
        k               :integer;

procedure daftar(var x:login);
begin
         gotoxy(45,3);
         writeln('Welcome to AirTelkom Administrator');
         writeln('========================================================================================================================');
         gotoxy(52,5);
         Writeln('Silahkan Login');
         gotoxy(35,7);
         write('Username       : ');
         gotoxy(35,8);
         write('Password       : ');
         gotoxy(52,7);
         readln(x.usrnm);
         gotoxy(52,8);
         readln(x.psswrd);

end;

Procedure cekpengguna(y:login;data:user;var user:string;var cek:boolean;var i:integer);
begin
        clrscr;
        cek:=false;
        if(y.usrnm=data[1].usrnm) and (y.psswrd=data[1].psswrd) then
                begin
                user:='ADHITIA WIRAGUNA';
                cek:=true;
                end
        else if(y.usrnm=data[2].usrnm) and (y.psswrd=data[2].psswrd) then
                begin
                user:='IHSANUL RASYID';
                cek:=true;
                end
        else if(y.usrnm=data[3].usrnm) and(y.psswrd=data[3].psswrd) then
                begin
                user:='GINA FITRIANI';
                cek:=true;
                end
        else if(y.usrnm=data[4].usrnm) and (y.psswrd=data[4].psswrd) then
                begin
                user:='ERLINAWATI';
                cek:=true;
                end
        else if(y.usrnm=data[5].usrnm) and (y.psswrd=data[5].usrnm) then
                begin
                user:='GUSHELMI';
                cek:=true;
                end;
end;
procedure isiarray(var isi:user);
begin
        isi[1].usrnm:='wiragunaadhitia';
        isi[1].psswrd:='adhitia10';
        isi[2].usrnm:='rasyidihsanul';
        isi[2].psswrd:='taurus13';
        isi[3].usrnm:='gina14';
        isi[3].psswrd:='ginafitriani';
        isi[4].usrnm:='erlina31';
        isi[4].psswrd:='linadesember';
        isi[5].usrnm:='gushelmi17';
        isi[5].psswrd:='170862';
end;
procedure inputJadwal(var x:data);
var     s:string;
        n,j:integer;
        sudahada:boolean;
begin
       n:=0;
       i:=1;
       repeat
        repeat
          clrscr;
          gotoxy(30,1);
          writeln('==========================================================');
          gotoxy(29,2);
          write('||                                                        ||');
          gotoxy(29,3);
          write('||                                                        ||');
          gotoxy(29,4);
          write('||                                                        ||');
          gotoxy(29,5);
          write('||                                                        ||');
          gotoxy(29,6);
          write('||                                                        ||');
          gotoxy(30,7);
          write('==========================================================');

          gotoxy(30,2);
          write('|Masukkan Kode Penerbangan   :');readln(x[i].kode);
          sudahada:=false;
          for j:=1 to n do
          begin
                if(x[i].kode=x[j].kode) then
                        sudahada:=true;
          end;
          if(sudahada=true) then
          begin
                clrscr;
                gotoxy(30,1);
                writeln('  =====================================================');
                gotoxy(30,2);
                writeln('||                    Kode Sudah Ada                  ||');
                gotoxy(30,3);
                writeln('||               INPUT ULANG KODE ANDA !              || ');
                gotoxy(30,4);
                writeln('  =====================================================');
                readln;
          end

          else
                sudahada:=false;

         until   (sudahada=false);
        gotoxy(30,3);
        write('|Masukkan Tanggal Penerbangan:');readln(x[i].tggl);
        gotoxy(30,4);
        write('|Masukkan Rute Penerbangan   :');readln(x[i].rute);
        gotoxy(30,5);
        write('|Masukkan Jam Penerbangan    :');readln(s);
        x[i].waktu.h:=s[1]+s[2];
        x[i].waktu.m:=s[4]+s[5];
        gotoxy(30,6);
        write('|Masukkan Kuota Penerbangan  :');readln(x[i].kuota);
        if (i<=4) then
        begin
                clrscr;
                gotoxy(30,1);
                writeln('===================================================');
                gotoxy(30,5);
                writeln('====================================================');
                gotoxy(30,2);
                writeln('            Ingin Menambahkan Data Kembali?        ');
                gotoxy(30,3);
                writeln('                       YES/NO                      ');gotoxy(55,4);readln(yesno);
        end;
        i:=i+1;
        n:=n+1;
        writeln;
        until (upcase(yesno)='NO') or (i>5);
        clrscr;
        gotoxy(30,1);
        writeln('==========================================================');
        gotoxy(29,2);
        write('||                                                        ||');
        gotoxy(29,3);
        write('||            BERHASIL MENGINPUTKAN JADWAL !              ||');
        gotoxy(29,4);
        write('||                                                        ||');
        gotoxy(29,5);
        write('||                                                        ||');
        gotoxy(30,7);
        write('==========================================================');
end;

function cekindeks(x:data;s:string):integer;
var     l:integer;
begin
        l:=1;
        while (s<>x[l].kode) and (l<=5) do
         begin
         l:=l+1;
         end;
        if(s=x[l].kode) then
                cekindeks:=l;


end;
function hitungArray (x:data):integer;
begin
         for i:=1 to 5 do
                if(X[i].kode<>'') then
                        hitungArray:=hitungArray+1;
end;
procedure sortByKode();
var
        min,i,k: integer;
        tmp     :jadwal;
begin
        for i:=1 to 4 do
        begin
                min:=i;
                for k:=i+1 to 5 do
                        if(j[k].kode<j[min].kode) then
                         min:=k;
        tmp:= j[min];
        j[min]:= j[i];
        j[i] := tmp;
        end;
end;
procedure showJadwal(x :data; i:integer);
begin
        for i:=1 to 5 do
        begin
        if(x[i].kuota<>0) then
         begin
          writeln('==========================================================');
          writeln('Kode Penerbangan      :',x[i].kode);
          writeln('Tanggal Penerbangan   :',x[i].tggl);
          writeln('Rute Penerbangan      :',x[i].rute);
          writeln('Jam Penerbangan       :',x[i].waktu.h,':',x[i].waktu.m);
          writeln('Kuota                 :',x[i].kuota);
          writeln('==========================================================');
          writeln;
         end;
        end;
end;
procedure menu1();
        forward;
procedure menu2();
        forward;
procedure menu3();
        forward;
procedure menu();
begin
        clrscr;
        textcolor(Yellow);
        writeln('ADMIN: ',pngguna);
        textcolor(white);
        gotoxy(30,1);
        writeln('==========================================================');
        gotoxy(30,2);
        writeln('||                  Menu ADMIN                          ||');
        gotoxy(30,3);
        writeln('||1. Input Jadwal                                       ||');
        gotoxy(30,4);
        writeln('||2. Ubah Jadwal                                        ||');
        gotoxy(30,5);
        writeln('||3. Lihat Jadwal                                       ||');
        gotoxy(30,6);
        writeln('==========================================================');
        gotoxy(30,7);
        write('Masukkan Pilihan Menu: ');gotoxy(55,7);readln(nmr);
        case nmr of
        1:
        begin
        clrscr;
        menu1();
        end;
        2:begin
        clrscr;
        menu2();
        end;
        3:begin
        clrscr;
        menu3();
        end;
        end;
end;
procedure menuexit();
begin
         clrscr;
         gotoxy(30,1);
         writeln('==========================================================');
         gotoxy(30,2);
         writeln('                KELUAR DARI PROGRAM?(YES/NO)              ');
         gotoxy(30,6);
         writeln('==========================================================');
         gotoxy(55,3);
         readln(yesno);
         if(upcase(yesno)='YES') then
                clrscr
         else
                menu();
end;
procedure menu1();
begin
        inputjadwal(j);

        gotoxy(29,8);
        writeln('||              Pilih menu Selanjutnya                   ||');
        gotoxy(29,9);
        writeln('||1. Back                                                ||');
        gotoxy(29,10);
        writeln('||2. Exit                                                ||');
        gotoxy(29,11);
        write(  '||Input Pilihan Menu : ');readln(nmr);
        if(nmr=1) then
                menu()
        else
                menuexit();
end;
procedure menu2();
var     kode:string;
        idks:integer;
        s:string;
        cek:integer;
begin
        cek:=0;
        for i:=1 to 5 do
        begin
                if(j[i].kode='') then
                 cek:=cek+1;
        end;
        if(cek=5) then
        begin
                 gotoxy(30,1);
                 writeln('==========================================================');
                 gotoxy(30,2);
                 writeln('               ANDA BELUM INPUT JADWAL!                   ');
                 gotoxy(30,6);
                 writeln('==========================================================');
                 readln;
                 menu();
        end
        else
        begin
                gotoxy(30,1);
                writeln('==========================================================');
                gotoxy(29,2);
                write('||                                                        ||');
                gotoxy(29,3);
                write('||                                                        ||');
                gotoxy(29,4);
                write('||                                                        ||');
                gotoxy(29,5);
                write('||                                                        ||');
                gotoxy(29,6);
                write('||                                                        ||');
                gotoxy(30,7);
                write('==========================================================');
                gotoxy(30,2);
                write('|Masukkan Kode Penerbangan   :');readln(kode);
                idks:=cekindeks(j,kode);
                if(idks<>-1) then
                gotoxy(30,3);
                write('|Masukkan Tanggal Penerbangan:');readln(j[idks].tggl);
                gotoxy(30,4);
                write('|Masukkan Rute Penerbangan   :');readln(j[idks].rute);
                gotoxy(30,5);
                write('|Masukkan Jam Penerbangan    :');readln(s);
                j[idks].waktu.h:=s[1]+s[2];
                j[idks].waktu.m:=s[4]+s[5];
                gotoxy(30,6);
                write('|Masukkan Kuota Penerbangan  :');readln(j[idks].kuota);
                writeln;
                clrscr;
                writeln('Jadwal Berhasil Diganti!');
                writeln('1. Back to Menu 2. Exit');
                readln(nmr);
                if(nmr=1) then
                        menu()
                else
                        menuexit();
        end;


end;
procedure menu3();
var cek:integer;
begin
        for i:=1 to 5 do
        begin
                if(j[i].kode='') then
                 cek:=cek+1;
        end;
        if(cek=5) then
                begin
                gotoxy(30,1);
                writeln('==========================================================');
                gotoxy(30,2);
                writeln('               ANDA BELUM INPUT JADWAL!                   ');
                gotoxy(30,6);
                writeln('==========================================================');
                readln;
                menu
                end
        else
        begin
                sortbyKode();
                showJadwal(j,k);
                writeln('1. Back to Menu 2. Exit');
                readln(nmr);
                if(nmr=1) then
                        menu()
                else
                        menuexit();
        end;

end;
Begin
        clrscr;
        gotoxy(45,3);
        writeln('Welcome to AirTelkom Administrator');
        writeln('========================================================================================================================');
        gotoxy(50,5);
        writeln('||1. Login  2.Exit||');
        gotoxy(50,7);
        write('Pilih nomor menu: '); readln(nmr);
        if(nmr=1) then
        begin
                clrscr;
                isiarray(simpan);
                daftar(datapengguna);
                cekpengguna(datapengguna,simpan,pngguna,cekcek,k);
                i:=1;
                while (cekcek<>true) and (i<3) do
                        begin
                        clrscr;
                        gotoxy(35,3);
                        writeln('Username atau password anda salah, ulangi kembali!');
                        gotoxy(40,4);
                        writeln('========================================');
                        gotoxy(45,5);
                        writeln('Tekan Enter untuk Login kembali');
                        readln;
                        clrscr;
                        gotoxy(35,3);
                        daftar(datapengguna);
                        cekpengguna(datapengguna,simpan,pngguna,cekcek,k);
                        i:=i+1;
                        end;
                if(cekcek=true) then
                begin
                        menu();
                end
                else
                begin
                     textcolor(red);
                     gotoxy(30,1);
                     writeln('===========================================================');
                     gotoxy(30,2);
                     writeln('||             Anda Sudah 3x Gagal Login                 ||');
                     gotoxy(30,3);
                     textcolor(red);
                     writeln('||               Program Akan keluar                     ||');
                     gotoxy(30,4);
                     writeln('===========================================================');
                end;
        end;
        readln;
end.
