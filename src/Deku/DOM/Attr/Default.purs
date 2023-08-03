module Deku.DOM.Attr.Default where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Default = Default

instance Attr Track_ Default (NonEmpty.NonEmpty Event.Event  String ) where
  attr Default bothValues = unsafeAttribute $ Both (pure 
    { key: "default", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "default", value: prop' value })
instance Attr Track_ Default  String  where
  attr Default value = unsafeAttribute $ This $ pure $
    { key: "default", value: prop' value }
instance Attr Track_ Default (Event.Event  String ) where
  attr Default eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "default", value: prop' value }

instance Attr everything Default (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Default bothValues = unsafeAttribute $ Both (pure 
    { key: "default", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "default", value: unset' })
instance Attr everything Default  Unit  where
  attr Default _ = unsafeAttribute $ This $ pure $ { key: "default", value: unset' }
instance Attr everything Default (Event.Event  Unit ) where
  attr Default eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "default", value: unset' }
