package Form::Factory::Test::Feature::Control::FillOnAssignment;
use Test::Able;

use Test::More;

with qw( Form::Factory::Test::Feature );

has '+feature' => (
    lazy      => 1,
    default   => sub {
        my $self = shift;
        $self->action->controls;
        (grep { $_->isa('Form::Factory::Feature::Control::FillOnAssignment') }
             @{ $self->action->features })[0];
    },
);

test plan => 1, set_ok => sub {
    my $self = shift;
    my $action = $self->action;

    $action->fill_on_assignment('James Tiberius Kirk');

    is($action->controls->{fill_on_assignment}->current_value, 'James Tiberius Kirk',
        'control got the action value on assignment');
};

1;
