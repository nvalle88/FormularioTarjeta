/*
 * Project: Pin
 * Description: Plugin for pin input, each digit is entered into individual input boxes
 * Author: https://github.com/sandy0201
 * License: MIT
 * Version: 0.0.1
 * Dependancies: jquery-1.*
 * Date: 15/06/2017
 */
;
(function ($, window, document, undefined) {
    'use strict';

    var pluginName = 'pin',
        defaults = {
            messages: {
                valid: 'Valid!',
                required: 'This field cannot be empty',
                numeric: 'This field requires a numeric value, no letters or special characters',
                sequential: 'This field cannot be sequential, e.g. 1234',
                repeat: 'This field cannot contain the same values only, e.g. 1111'
            },
            count: 4,
            displayMessage: {},
            isPassword: false,
            showvValidErrorMessage: true,
            allowSequential: true,
            allowRepeat: true,
            compare: [3, 4, 5, 6, 7, 8]
        };

    function plugin(element, options) {
        this.element = element;
        this.settings = defaults;
        this._defaults = defaults;
        this._name = pluginName;

        if (options !== undefined && options !== null) {
            for (var a in defaults) {
                if (typeof defaults[a] !== 'object') {
                    if (options[a] !== undefined) {
                        this.settings[a] = options[a];
                    }
                } else {
                    if (defaults[a] !== undefined) {
                        for (var b in defaults[a]) {
                            if (options[a] !== undefined && options[a][b] !== undefined) {
                                this.settings[a][b] = options[a][b];
                            }
                        }
                    }
                }
            }

            for (var a in options) {
                if (typeof options[a] === 'object') {
                    for (var b in options[a]) {
                        if (this.settings[a][b] === undefined) {
                            this.settings[a][b] = options[a][b];
                        }
                    }
                }
            }
        }

        this.init();
    }

    $.extend(plugin.prototype, {
        init: function (isSubmitted) {
            isSubmitted = isSubmitted || false;
            var scope = this;

            if ($(scope.element).children().length === 0) {
                if (scope.settings !== undefined && scope.settings !== null) {
                    for (var i = 0; i < scope.settings.count; i++) {
                        if (scope.settings.isPassword && scope.settings.showvValidErrorMessage) {
                            $(scope.element).append('<input type="password"  name="pin_' + i + '" data-vvalid="numeric|min:1|max:1" maxlength="1" />');
                        } else if (scope.settings.isPassword) {
                            $(scope.element).append('<input type="password" name="pin_' + i + '" data-vvalid="numeric|min:1|max:1" data-vvalid-error-text="false" maxlength="1" />');
                        } else if (scope.settings.showvValidErrorMessage) {
                            $(scope.element).append('<input type="text" name="pin_' + i + '" data-vvalid="numeric|min:1|max:1" maxlength="1" />');
                        } else {
                            $(scope.element).append('<input type="text" name="pin_' + i + '" data-vvalid="numeric|min:1|max:1" data-vvalid-error-text="false" maxlength="1" />');
                        }
                    }
                }
            }

            return scope.isNotAForm(scope.element, isSubmitted);

        },
        isNotAForm: function (element, isSubmitted) {
            var scope = this;
            var inputs = [];

            $.each($(element).children(), function () {
                inputs.push(this);

                scope.focus(this);
                var validation = scope.validate(inputs);
                scope.customValidate(this, inputs, validation);
            });

            if (isSubmitted) {
                var validation = scope.validate(inputs);

                $.each(inputs, function () {
                    (!validation.valid) ? $(this).addClass('error') : $(this).removeClass('error');
                });

                $(scope.settings.displayMessage).html(validation.message);

                return validation.valid;
            }
        },

        customValidate: function (input, inputs, validation) {
            var scope = this;
            //$(input).on('change',
            //    function(evt) {
            //        var countWithValue = 0;
            //        for (var y = 0; y < inputs.length; ++y) {
            //            if ($(inputs[y]).val()) {
            //                countWithValue++;
            //            }
            //        }
            //        viewModel.countToken(false);
            //        if (countWithValue === inputs.length) {
            //            viewModel.countToken(true);
            //        }
            //    });

            $(input).on('keypress', function (evt) {
                var theEvent = evt || window.event;
                var key = theEvent.keyCode || theEvent.which;
                key = String.fromCharCode(key);
                var regex = /[0-9]/;
                if (!regex.test(key)) {
                    theEvent.returnValue = false;
                    evt.preventDefault();
                    return;
                }
                var indice = Number($(input).attr("name").split("_")[1]);
                var i = 1;
                var y = 0;

                if (key === scope.settings.compare[indice]) {
                    for (var z = 0; z < inputs.length; ++z) {
                        if ($(input).attr("name") !== $(inputs[z]).attr("name")) {
                            indice = Number($(inputs[z]).attr("name").split("_")[1]);
                            if ($(inputs[z]).val() === scope.settings.compare[indice]) {
                                i++;
                            } else if ($(inputs[z]).val() !== "" && $(inputs[z]).val() !== scope.settings.compare[indice]) {
                                y++;
                            }
                        }
                    }

                    //$.each(inputs, function () {
                    //    if ($(input).attr("name") !== $(this).attr("name")) {
                    //        indice = Number($(this).attr("name").split("_")[1]);
                    //        if ($(this).val() === scope.settings.compare[indice]) {
                    //            i++;
                    //        } else if ($(this).val() !== scope.settings.compare[indice])  {
                    //            y++;
                    //        }

                    //    }
                    //});
                } else if (key !== scope.settings.compare[indice]) {
                    $.each(inputs,
                        function () {
                            if ($(input).attr("name") !== $(this).attr("name")) {
                                if ($(this).val() && $(this).val().length > 0) {
                                    y++;
                                }

                            }
                        });
                }

                viewModel.countToken(false);
                viewModel.tokenValid(false);

                if (y > 0 && (y + i) === scope.settings.count) {
                    viewModel.countToken(true);
                } else if (i === scope.settings.count) {
                    viewModel.tokenValid(true);
                }







                setTimeout(function () {
                    $(input).next().focus();
                    $(input).next().select();
                }, 10);

            });

        },

        focus: function (input) {
            $(input).on('click', function () {
                // $(input).val('');
                $(input).select();
            });

            $(input).on('keypress', function () {

            });

        },
        validate: function (inputs) {
            var scope = this;
            var emptyCount = 0;
            var digits = [];

            $.each(inputs, function () {
                // console.log($(this).val());
            });

            return true;

            //$.each(inputs, function () {

            //    digits.push(parseInt($(this).val()));
            //    if ($(this).val() === '') {
            //        emptyCount++;
            //    }
            //});

            //if (emptyCount === digits.length) {
            //    return { 'valid': false, 'message': scope.settings.messages.required };
            //}

            //for (var i = 0; i < digits.length; i++) {
            //    if (isNaN(parseInt(digits[i]))) {
            //        return { 'valid': false, 'message': scope.settings.messages.numeric };
            //    }
            //}

            //if (!scope.settings.allowSequential) {
            //    if (!scope.sequential(digits)) {
            //        return { 'valid': false, 'message': scope.settings.messages.sequential };
            //    }
            //}

            //if (!scope.settings.allowRepeat) {
            //    if (!scope.repeat(digits)) {
            //        return { 'valid': false, 'message': scope.settings.messages.repeat };
            //    }
            //}

            //return { 'valid': true, 'message': scope.settings.messages.valid };
        },
        sequential: function (digits) {
            var sequentialDigits = [];

            for (var i = 0; i < digits.length; i++) {
                sequentialDigits.push(digits[0] + i);
            }

            if (JSON.stringify(digits) === JSON.stringify(sequentialDigits)) {
                return false;
            }

            return true;
        },
        repeat: function (digits) {
            var repeatDigits = [];

            for (var i = 0; i < digits.length; i++) {
                if (i > 0) {
                    (digits[0] === digits[i]) ? repeatDigits.push(true) : repeatDigits.push(false);
                }
            }

            if ($.inArray(false, repeatDigits) === -1) {
                return false;
            }

            return true;
        }
    });

    $.fn[pluginName] = function (options) {
        return this.each(function () {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new plugin(this, options));
            }
        });
    };

    $.extend($.pin, {
        destroy: function () {
            delete this.validate;
        }
    });
})(jQuery, window, document);