import sys
from pathlib import Path

EXCLUDED_PATHS = [Path(r'sDNA/geos'),
                 ]



def paths():
    for path in Path('.').glob(r'**/*.cpp'):
    
        if any(path.is_relative_to(excluded_path) 
               for excluded_path in EXCLUDED_PATHS):
            continue
    
        yield str(path).replace('\\','/') if sys.platform == 'win32' else str(path)
    


print('SOURCES=\\')
print(*[f'  {path}' for path in paths()],sep='  \\\n')