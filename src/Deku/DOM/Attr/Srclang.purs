module Deku.DOM.Attr.Srclang where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Track (Track_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srclang = Srclang

instance Attr Track_ Srclang (NonEmpty.NonEmpty Event.Event  String ) where
  attr Srclang bothValues = unsafeAttribute $ Both
    { key: "srclang", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "srclang", value: prop' value })
instance Attr Track_ Srclang  String  where
  attr Srclang value = unsafeAttribute $ This $ pure $
    { key: "srclang", value: prop' value }
instance Attr Track_ Srclang (Event.Event  String ) where
  attr Srclang eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srclang", value: prop' value }

instance Attr everything Srclang (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Srclang bothValues = unsafeAttribute $ Both
    { key: "srclang", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "srclang", value: unset' })
instance Attr everything Srclang  Unit  where
  attr Srclang _ = unsafeAttribute $ This $ pure $ { key: "srclang", value: unset' }
instance Attr everything Srclang (Event.Event  Unit ) where
  attr Srclang eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "srclang", value: unset' }
