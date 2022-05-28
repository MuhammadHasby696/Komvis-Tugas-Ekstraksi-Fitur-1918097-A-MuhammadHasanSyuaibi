function varargout = EkstraksiFiturWarna_PadaCitraIkanHias(varargin)
% EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS MATLAB code for EkstraksiFiturWarna_PadaCitraIkanHias.fig
%      EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS, by itself, creates a new EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS or raises the existing
%      singleton*.
%
%      H = EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS returns the handle to a new EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS or the handle to
%      the existing singleton*.
%
%      EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS.M with the given input arguments.
%
%      EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS('Property','Value',...) creates a new EKSTRAKSIFITURWARNA_PADACITRAIKANHIAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EkstraksiFiturWarna_PadaCitraIkanHias_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EkstraksiFiturWarna_PadaCitraIkanHias_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EkstraksiFiturWarna_PadaCitraIkanHias

% Last Modified by GUIDE v2.5 28-May-2022 15:28:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EkstraksiFiturWarna_PadaCitraIkanHias_OpeningFcn, ...
                   'gui_OutputFcn',  @EkstraksiFiturWarna_PadaCitraIkanHias_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EkstraksiFiturWarna_PadaCitraIkanHias is made visible.
function EkstraksiFiturWarna_PadaCitraIkanHias_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EkstraksiFiturWarna_PadaCitraIkanHias (see VARARGIN)

% Choose default command line output for EkstraksiFiturWarna_PadaCitraIkanHias
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EkstraksiFiturWarna_PadaCitraIkanHias wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EkstraksiFiturWarna_PadaCitraIkanHias_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in buttonInput.
function buttonInput_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
[namafile]=uigetfile({'*.jpg;*.png;*.jpeg;*.webp;*.bmp;*.tif'},'openimage');
I=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I);

% --- Executes on button press in buttonEkstraksi.
function buttonEkstraksi_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
rgbImage=get(open.axes1,'Userdata');
cR=rgbImage(:,:,1);
cG=rgbImage(:,:,2);
cB=rgbImage(:,:,3);
rata2Red=mean(mean(cR));
rata2Green=mean(mean(cG));
rata2Blue=mean(mean(cB));
nR=rata2Red/255;
nG=rata2Green/255;
nB=rata2Blue/255;
hasilNormalisasi=(nR+nG+nB);
set(handles.editRed,'String',nR)
set(handles.editGreen,'String',nG)
set(handles.editBlue,'String',nB)
set(handles.editHasil,'String',hasilNormalisasi)


function editBlue_Callback(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBlue as text
%        str2double(get(hObject,'String')) returns contents of editBlue as a double


% --- Executes during object creation, after setting all properties.
function editBlue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editRed_Callback(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editRed as text
%        str2double(get(hObject,'String')) returns contents of editRed as a double


% --- Executes during object creation, after setting all properties.
function editRed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editGreen_Callback(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editGreen as text
%        str2double(get(hObject,'String')) returns contents of editGreen as a double


% --- Executes during object creation, after setting all properties.
function editGreen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editHasil_Callback(hObject, eventdata, handles)
% hObject    handle to editHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editHasil as text
%        str2double(get(hObject,'String')) returns contents of editHasil as a double


% --- Executes during object creation, after setting all properties.
function editHasil_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in buttonReset.
function buttonReset_Callback(hObject, eventdata, handles)
set(handles.editRed,'String','');
set(handles.editGreen,'String','');
set(handles.editBlue,'String','');
set(handles.editHasil,'String','');
