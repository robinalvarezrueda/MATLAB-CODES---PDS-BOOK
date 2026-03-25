%% PRACTICE 8.10. Digital telephone exchange

% Sampling frequency (fs) for an 8000 Hz signal
precision = 20e-3;
% Sampling frequency
fs = 8000; % Telephone voice band
% Create an object with parameters: fs, 16 bits, 1 channel (out of 2 possible)
recObj = audiorecorder(fs,16,1); % Create the object to acquire the signal

% Counters
aux1 = 0;  % Used for the time vector t and final_signal
aux2 = 0;  % Used to shift the x-axis and emulate an oscilloscope
aux3 = 0;  % Used by the auxiliary variable that builds the time vector
% Curve sweep / motion simulation
ta = precision*1;
% X-axis window size: 3 ms
duration = precision;
% NFFT factor
Factor = 64;

x = 0; % Stop condition controlled by software
while x == 0   % Start (x=0)
    drawnow() % Update plot immediately
    % Use the object: acquire signal in blocks of "duration" seconds
    recordblocking(recObj, precision);
    % GETAUDIODATA: retrieve the stored signal
    signal = getaudiodata(recObj, 'single');
    % Get signal length
    L = length(signal);
    % Store the full accumulated signal
    final_signal(aux1+1:aux1+L) = signal;
    % Auxiliary variable used to extend the time vector length
    aux = linspace(aux3, aux3+duration, L);
    % Build the time vector
    t(aux1+1:aux1+L) = aux;
    % ------------------------------------------------------------
    % Plot configuration (Time domain)
    figure(1)
    p = plot(t, final_signal, 'b');
    grid minor;
    set(p,'linewidth',2);            % Line width
    set(gca,'FontWeight','bold');    % Bold axis labels
    axis([aux2 aux2+duration min(final_signal)*2 max(final_signal)*2])
    % Moving x-axis window
    % ------------------------------------------------------------
    % -------------------- Frequency domain ----------------------
    N = length(signal);
    nFFT = 2^ceil(log2(N)) * Factor; % nFFT computation
    Y = fft(signal, nFFT);           % FFT complex coefficients
    P1 = abs(Y);                     % Magnitude (periodogram)
    P = P1(1:nFFT/2+1);
    f = fs*(0:(nFFT/2))/nFFT;

    figure(2)
    q = plot(f, P, 'r');
    grid minor;
    set(q,'linewidth',1.2);          % Line width
    set(gca,'FontWeight','bold');    % Bold axis labels
    axis([0 2e3 0 max(P)])

        % Number of peaks
    NF = 2;
    % n peaks and their corresponding frequencies
    [peaks, locations] = findpeaks(P,'SortStr','descend','NPeaks',NF);
    Frequencies = f(locations);
    Key = keyDetection(Frequencies);
    if Key ~= 0
        fprintf('The pressed key is: %s.\n', Key);
    end
end
