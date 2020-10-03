function PaginationExampleViewModel() {
    this.page = ko.observable(1);

    this.total = ko.observable(100);

    this.maxPages = ko.observable(5);

    this.directions = ko.observable(true);

    this.boundary = ko.observable(true);

    this.text = {
        first: ko.observable('First'),
        last: ko.observable('Last'),
        back: ko.observable('&laquo;'),
        forward: ko.observable('&raquo;')
    };
}

function ExamplesViewModel() {
    var self = this;

    self.paginationExample = new PaginationExampleViewModel();


    var ste = ko.stringTemplateEngine.instance;

    ste.addTemplate('demo', '<span>It\'s a <strong>string template engine</strong>!</span>');
}

if (!ko.bindingHandlers.modal) {
    alert('You need build Knockstrap.js at first');
}

var vm = new ExamplesViewModel();
ko.applyBindings(vm);
