module Deku.DOM.Attr.Srcdoc where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcdoc = Srcdoc

instance Attr Iframe_ Srcdoc (NonEmpty.NonEmpty Event.Event  String ) where
  attr Srcdoc bothValues = unsafeAttribute $ Both
    { key: "srcdoc", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "srcdoc", value: prop' value })
instance Attr Iframe_ Srcdoc  String  where
  attr Srcdoc value = unsafeAttribute $ This $ pure $
    { key: "srcdoc", value: prop' value }
instance Attr Iframe_ Srcdoc (Event.Event  String ) where
  attr Srcdoc eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srcdoc", value: prop' value }

instance Attr everything Srcdoc (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Srcdoc bothValues = unsafeAttribute $ Both
    { key: "srcdoc", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "srcdoc", value: unset' })
instance Attr everything Srcdoc  Unit  where
  attr Srcdoc _ = unsafeAttribute $ This $ pure $ { key: "srcdoc", value: unset' }
instance Attr everything Srcdoc (Event.Event  Unit ) where
  attr Srcdoc eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "srcdoc", value: unset' }
