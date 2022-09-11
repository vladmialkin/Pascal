unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Menus, StdCtrls;

type
  hall = record
    id: integer;
    size: 1..200;
  end;
  film = record
    id: integer;
    name: string;
    genre: string;
  end;
  sale = record
    id: integer;
    film_id: integer;
    hall_id: integer;
    time: string;
    id_place: 1..200;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    btn_load_file: TButton;
    ButSave_sale: TBitBtn;
    ButSave_hall: TBitBtn;
    ButSave_film: TBitBtn;
    btn_save_file: TButton;
    Edit_sale_id_hall: TEdit;
    Edit_sale_id_film: TEdit;
    Edit_sale_id_place: TEdit;
    Edit_sale_time: TEdit;
    Edit_id: TEdit;
    Edit_hall_size: TEdit;
    Edit_film_name: TEdit;
    Edit_film_genre: TEdit;
    label_film_genre: TLabel;
    label_sale_id_place: TLabel;
    label_sale_time: TLabel;
    label_sale_id_hall: TLabel;
    label_sale_id_film: TLabel;
    label_hall_id: TLabel;
    label_hall_size: TLabel;
    label_film_name: TLabel;
    MainMenu1: TMainMenu;
    MemoSale: TMemo;
    MemoHall: TMemo;
    MemoFilm: TMemo;
    procedure btn_load_fileClick(Sender: TObject);
    procedure ButSave_filmClick(Sender: TObject);
    procedure ButSave_hallClick(Sender: TObject);
    procedure btn_save_fileClick(Sender: TObject);
    procedure ButSave_saleClick(Sender: TObject);
    procedure Edit_sale_timeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure label_sale_timeClick(Sender: TObject);
    procedure MemoHallChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  id_hall: integer;
  id_film: integer;
  id_sale: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.label_sale_timeClick(Sender: TObject);
begin

end;

procedure TForm1.MemoHallChange(Sender: TObject);
begin

end;


procedure TForm1.ButSave_hallClick(Sender: TObject);
var new_hall: hall;
begin
     with new_hall do begin
          id:= id_hall;
          size:= StrToInt(Edit_hall_size.Text);
          MemoHall.Lines[id_hall] := 'Зал ' + IntToStr(id_hall+1) + ' вместимость:' + Edit_hall_size.Text;
          inc(id_hall);
     end;
end;

procedure TForm1.btn_save_fileClick(Sender: TObject);
begin
    MemoHall.Lines.SaveToFile('D:\halls.txt');
    MemoFilm.Lines.SaveToFile('D:\films.txt');
    MemoSale.Lines.SaveToFile('D:\sales.txt');
end;

procedure TForm1.ButSave_saleClick(Sender: TObject);
var new_sale: sale;
begin
    with new_sale do begin
         id:= id_sale;
         film_id:= StrToInt(Edit_sale_id_film.Text);
         hall_id:= StrToInt(Edit_sale_id_hall.Text);
         time:= Edit_sale_time.Text;
         id_place:= StrToInt(Edit_sale_id_place.Text);
         MemoSale.Lines[id_sale] := IntToStr(id_sale+1) + ' Фильм ' + Edit_sale_id_film.Text + ' зал ' + Edit_sale_id_hall.Text + ' время:' + time + ' место:' + Edit_sale_id_place.Text;
         inc(id_sale);
    end;
end;

procedure TForm1.Edit_sale_timeChange(Sender: TObject);
begin

end;

procedure TForm1.ButSave_filmClick(Sender: TObject);
var new_film: film;
begin
     with new_film do begin
          id:= id_film;
          name:= Edit_film_name.Text;
          genre:= Edit_film_genre.Text;
          MemoFilm.Lines[id_film] := IntToStr(id_film+1) + ' ' + name + ' ' + genre;
          inc(id_film);
     end;
end;

procedure TForm1.btn_load_fileClick(Sender: TObject);
begin
    MemoHall.Lines.LoadFromFile('D:\halls.txt');
    id_hall:= MemoHall.Lines.count;
    MemoFilm.Lines.LoadFromFile('D:\films.txt');
    id_film:= MemoFilm.Lines.count;
    MemoSale.Lines.LoadFromFile('D:\sales.txt');
    id_sale:= MemoSale.Lines.count;
end;

end.

