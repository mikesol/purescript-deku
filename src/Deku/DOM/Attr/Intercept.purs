module Deku.DOM.Attr.Intercept where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intercept = Intercept

instance Attr FeFuncA_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncA_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncA_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncB_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncB_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncB_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncG_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncG_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncG_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr FeFuncR_ Intercept (NonEmpty.NonEmpty Event.Event  String ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "intercept", value: prop' value })
instance Attr FeFuncR_ Intercept  String  where
  attr Intercept value = unsafeAttribute $ This $ pure $
    { key: "intercept", value: prop' value }
instance Attr FeFuncR_ Intercept (Event.Event  String ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "intercept", value: prop' value }

instance Attr everything Intercept (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Intercept bothValues = unsafeAttribute $ Both (pure 
    { key: "intercept", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "intercept", value: unset' })
instance Attr everything Intercept  Unit  where
  attr Intercept _ = unsafeAttribute $ This $ pure $
    { key: "intercept", value: unset' }
instance Attr everything Intercept (Event.Event  Unit ) where
  attr Intercept eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "intercept", value: unset' }
