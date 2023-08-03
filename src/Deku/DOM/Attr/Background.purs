module Deku.DOM.Attr.Background where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Body (Body_)
import Deku.DOM.Elt.Table (Table_)
import Deku.DOM.Elt.Td (Td_)
import Deku.DOM.Elt.Th (Th_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Background = Background

instance Attr Body_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Body_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Body_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Table_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Table_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Table_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Td_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Td_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Td_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr Th_ Background (NonEmpty.NonEmpty Event.Event  String ) where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "background", value: prop' value })
instance Attr Th_ Background  String  where
  attr Background value = unsafeAttribute $ This $ pure $
    { key: "background", value: prop' value }
instance Attr Th_ Background (Event.Event  String ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "background", value: prop' value }

instance Attr everything Background (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Background bothValues = unsafeAttribute $ Both
    { key: "background", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "background", value: unset' })
instance Attr everything Background  Unit  where
  attr Background _ = unsafeAttribute $ This $ pure $
    { key: "background", value: unset' }
instance Attr everything Background (Event.Event  Unit ) where
  attr Background eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "background", value: unset' }
