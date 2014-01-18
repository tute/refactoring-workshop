# Refactoring Workshop

Requerimientos: Ruby >1.9.3, git y la gema `minitest`.

Cada carpeta tiene el nombre del patrón de refactoring a practicar, y los
siguientes archivos:

* `setup.rb` código de inicialización necesario para `app.rb` (sería el
  "framework", o el resto de la aplicación). No lo editaremos.
* `tests.rb` el nombre lo explica. :) Necesarios para la vida, especialmente
  para refactorizar.
* `app.rb` código sobre el que trabajaremos.
* `solucion-tute.rb` mi aplicación del patrón a `app.rb`.

Para ejecutar tests sólo tienen que ejecutar `app.rb`, por ejemplo:

```bash
$ ruby app.rb
Run options: --seed 53634

# Running:
..

Finished in 0.001191s, 1679.2611 runs/s, 3358.5223 assertions/s.

2 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```

# Patrones de Refactorización

## 1. Intention Revealing Method

## 2. Special Case Object

## 3. Replace Method with Method Object

Notas de implementación: contiene dos archivos adicionales necesarios para los
tests: `fixtures/input.csv` y `fixtures/output.csv`, y no contiene `setup.rb`.

## 4. Service Object

# Presentación - Slides

Pueden abrir `presentacion/index.html` en el navegador web.
