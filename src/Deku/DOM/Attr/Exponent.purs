module Deku.DOM.Attr.Exponent where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Exponent = Exponent

instance Attr FeFuncA_ Exponent (NonEmpty.NonEmpty Event.Event  String ) where
  attr Exponent bothValues = unsafeAttribute $ Both (pure 
    { key: "exponent", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "exponent", value: prop' value })
instance Attr FeFuncA_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ This $ pure $
    { key: "exponent", value: prop' value }
instance Attr FeFuncA_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }

instance Attr FeFuncB_ Exponent (NonEmpty.NonEmpty Event.Event  String ) where
  attr Exponent bothValues = unsafeAttribute $ Both (pure 
    { key: "exponent", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "exponent", value: prop' value })
instance Attr FeFuncB_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ This $ pure $
    { key: "exponent", value: prop' value }
instance Attr FeFuncB_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }

instance Attr FeFuncG_ Exponent (NonEmpty.NonEmpty Event.Event  String ) where
  attr Exponent bothValues = unsafeAttribute $ Both (pure 
    { key: "exponent", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "exponent", value: prop' value })
instance Attr FeFuncG_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ This $ pure $
    { key: "exponent", value: prop' value }
instance Attr FeFuncG_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }

instance Attr FeFuncR_ Exponent (NonEmpty.NonEmpty Event.Event  String ) where
  attr Exponent bothValues = unsafeAttribute $ Both (pure 
    { key: "exponent", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "exponent", value: prop' value })
instance Attr FeFuncR_ Exponent  String  where
  attr Exponent value = unsafeAttribute $ This $ pure $
    { key: "exponent", value: prop' value }
instance Attr FeFuncR_ Exponent (Event.Event  String ) where
  attr Exponent eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "exponent", value: prop' value }

instance Attr everything Exponent (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Exponent bothValues = unsafeAttribute $ Both (pure 
    { key: "exponent", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "exponent", value: unset' })
instance Attr everything Exponent  Unit  where
  attr Exponent _ = unsafeAttribute $ This $ pure $
    { key: "exponent", value: unset' }
instance Attr everything Exponent (Event.Event  Unit ) where
  attr Exponent eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "exponent", value: unset' }
