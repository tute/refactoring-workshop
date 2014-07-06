# Refactoring Workshop

Requerimientos: Ruby >1.9.3, git y la gema `minitest`.

Cada carpeta tiene el nombre del patrón de refactoring a practicar, y los
siguientes archivos:

* `app.rb` código sobre el que trabajaremos.
* `setup.rb` código de inicialización necesario para `app.rb` (sería el
  "framework", o el resto de la aplicación). No lo editaremos.
* `tests.rb` el nombre lo explica. :) Necesarios para la vida, especialmente
  para refactorizar.

Ejecutar `bundle` para asegurarse de tener las rubygems necesarias para correr
tests (`rake` y `minitest`).

Ejecutar tests via `rake`:

```bash
$ rake
Run options: --seed 61694

# Running:

..........

Finished in 0.016857s, 593.2254 runs/s, 1423.7409 assertions/s.

10 runs, 24 assertions, 0 failures, 0 errors, 0 skips
```

# Patrones de Refactorización

## 1. Intention Revealing Method

## 2. Special Case Object

## 3. Replace Method with Method Object

Notas de implementación: contiene dos archivos adicionales necesarios para los
tests: `fixtures/input.csv` y `fixtures/output.csv`, y no contiene `setup.rb`.

## 4. Service Object

# Presentación - Slides

Pueden abrir `es_slides/index.html` en el navegador web.
