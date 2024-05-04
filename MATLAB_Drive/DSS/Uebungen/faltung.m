function varargout = faltung(varargin)
% FALTUNG M-file for faltung.fig
%      FALTUNG, by itself, creates a new FALTUNG or raises the existing
%      singleton*.
%
%      H = FALTUNG returns the handle to a new FALTUNG or the handle to
%      the existing singleton*.
%
%      FALTUNG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FALTUNG.M with the given input arguments.
%
%      FALTUNG('Property','Value',...) creates a new FALTUNG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before faltung_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to faltung_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help faltung

% Last Modified by GUIDE v2.5 12-Oct-2008 15:21:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @faltung_OpeningFcn, ...
                   'gui_OutputFcn',  @faltung_OutputFcn, ...
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

% --- Executes just before faltung is made visible.
function faltung_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to faltung (see VARARGIN)

% Choose default command line output for faltung
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

global t;
global tau;
global siga;
global sigb;

axes(handles.axes1);
cla;

% Base signals
t = -3:.05:10;
tau = 0:.05:2;
t0 = 0;

% Create rectangle
siga = zeros(1,length(t));
siga(find(t>=0)) = 1;
siga(find(t>3)) = 0;

% Create triangle
sigb = [0 triang(2*length(tau)-2).' 0];
sigb = [sigb(1:length(tau)) 0];
tau = 0:.05:2.05;

% This sets up the initial plot - only do when we are invisible
% so window can get raised using faltung.
plot(t,siga,t0-tau,sigb,t0,0,'ro');
legend('x(t)','y(t_0-t)','t_0');
xlim([min(t) max(t)]);
ylim([-.1 1.1]);
grid;

axes(handles.axes2);
cla;

SIG = falt(t0,t,siga,tau,sigb);
SIG2 = conv(siga,sigb)*(t(2)-t(1));
plot(t,SIG2(1:length(t)),'b',t0,max(SIG),'ro');
xlim([min(t) max(t)]);
ylim([-.1 1.1]);
grid

% UIWAIT makes faltung wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = faltung_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global t;
global tau;
global siga;
global sigb;

axes(handles.axes1);
cla;

t0 = round(get(hObject,'Value')*20)*.05;

plot(t,siga,t0-tau,sigb,t0,0,'ro');
xlim([min(t) max(t)]);
ylim([-.1 1.1]);
legend('x(t)','y(t_0-t)','t_0');
grid;

axes(handles.axes2);
cla;

SIG = falt(t0,t,siga,tau,sigb);
SIG2 = conv(siga,sigb)*(t(2)-t(1));
plot(t,SIG2(1:length(t)),'b',t0,max(SIG),'ro');
xlim([min(t) max(t)]);
ylim([-.1 1.1]);
grid;


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
