# Taller de Refactorización

Requerimientos: Ruby >= 2.7, git, bundler.

Cada carpeta lleva por nombre el patrón de refactoring a practicar, y los
siguientes archivos:

* `app.rb` código sobre el que trabajaremos.
* `setup.rb` código de inicialización necesario para `app.rb` (sería el
  "framework", o el resto de la aplicación). No necesitamos conocerlo o editarlo,
  a no ser que sea por curiosidad.
* `test_app.rb` el nombre lo explica. Necesarios para la vida, especialmente si
    pensamos refactorizar.

Ejecutar `bundle` para asegurarse de tener las rubygems necesarias para correr
tests.

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

Nota de implementación: contiene dos archivos adicionales necesarios para los
tests: `fixtures/input.csv` y `fixtures/output.csv`, y no contiene `setup.rb`.

## 4. Service Object


# Slides

* [Slides (English)](https://github.com/tute/refactoring-workshop-slides-sep-2015/)
* [Slides (Español)](https://www.tutecosta.com/refactoring-workshop-slides-sep-2015/#/) [repo](https://github.com/tute/refactoring-workshop-slides-sep-2015/tree/es)

# In English

[English version of this doc available](https://github.com/tute/refactoring-workshop/blob/master/README.md).
