module Deku.DOM.Attr.Csp where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Csp = Csp

instance Attr Iframe_ Csp (NonEmpty.NonEmpty Event.Event  String ) where
  attr Csp bothValues = unsafeAttribute $ Both
    { key: "csp", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "csp", value: prop' value })
instance Attr Iframe_ Csp  String  where
  attr Csp value = unsafeAttribute $ This $ pure $ { key: "csp", value: prop' value }
instance Attr Iframe_ Csp (Event.Event  String ) where
  attr Csp eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "csp", value: prop' value }

instance Attr everything Csp (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Csp bothValues = unsafeAttribute $ Both { key: "csp", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "csp", value: unset' })
instance Attr everything Csp  Unit  where
  attr Csp _ = unsafeAttribute $ This $ pure $ { key: "csp", value: unset' }
instance Attr everything Csp (Event.Event  Unit ) where
  attr Csp eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "csp", value: unset' }
