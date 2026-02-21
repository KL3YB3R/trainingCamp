document.addEventListener('DOMContentLoaded', function() {
    // Esperar un momento para que todo cargue
    setTimeout(function() {
        // Interceptar todos los formularios con validación
        $('form').each(function() {
            var form = $(this);
            var validator = form.data('validator');
            
            if (validator) {
                console.log('Encontrado validador en:', form.attr('id') || form.attr('class'));
                
                // Forzar configuración
                $.extend(validator.settings, {
                    errorClass: 'is-invalid',
                    validClass: 'is-valid',
                    errorElement: 'div',
                    highlight: function(element) {
                        $(element).addClass('is-invalid').removeClass('is-valid');
                        
                        // También agregar a los labels
                        var label = $('label[for="' + $(element).attr('id') + '"]');
                        if (label.length) {
                            label.addClass('text-danger');
                        }
                    },
                    unhighlight: function(element) {
                        $(element).removeClass('is-invalid').addClass('is-valid');
                        
                        var label = $('label[for="' + $(element).attr('id') + '"]');
                        if (label.length) {
                            label.removeClass('text-danger');
                        }
                    },
                    errorPlacement: function(error, element) {
                        error.addClass('invalid-feedback');
                        
                        // Si ya hay un contenedor de error, usarlo
                        var existingError = element.next('.invalid-feedback');
                        if (existingError.length) {
                            existingError.html(error.html());
                        } else {
                            element.after(error);
                        }
                    }
                });
                
                // Re-aplicar validación a campos existentes
                form.find(':input').each(function() {
                    if (!validator.element(this) && $(this).hasClass('error')) {
                        $(this).addClass('is-invalid');
                    }
                });
            }
        });
        
        // También interceptar futuras inicializaciones
        var originalInit = window.JsValidation.init;
        if (originalInit) {
            window.JsValidation.init = function() {
                originalInit.apply(this, arguments);
                
                // Después de que JSValidation inicialice, aplicar nuestros estilos
                setTimeout(function() {
                    $('form').each(function() {
                        var validator = $(this).data('validator');
                        if (validator) {
                            $(this).find('.error').addClass('is-invalid');
                            $(this).find('.error-message').addClass('invalid-feedback');
                        }
                    });
                }, 100);
            };
        }
    }, 500); // Dar tiempo a que cargue JSValidation
});