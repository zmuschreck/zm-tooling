# Einen einzelnen Container laufen lassen
  docker run alpine hostname

# Docker run kennt den detached Mode (-d), der Container läuft im Hintergrund weiter:
  docker run -d alpine sleep 30
  
# Alle laufenden Container anzeigen
  docker container ls
 
# Gleiches funktioniert auch mit
  docker ps

# Die -a Option zeigt alle Container Status
  docker ps -a 