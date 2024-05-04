% Erstellen einer Beispiel-Funktionsdefinition für das Vektorfeld
function [u, v, w] = vectorFieldFunction(x, y, z)
    % Hier können Sie Ihre eigene Logik zur Berechnung der Vektorfeldkomponenten implementieren
    % Beispiel: Vektorfeldkomponenten als Sinus- und Cosinus-Funktionen
    u = x./sqrt(pow(pow2(x)+pow2(y)+pow2(z),3));
    v = y./sqrt(pow(pow2(x)+pow2(y)+pow2(z),3));
    w = z./sqrt(pow(pow2(x)+pow2(y)+pow2(z),3));
end