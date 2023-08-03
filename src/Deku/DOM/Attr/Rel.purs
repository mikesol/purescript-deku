module Deku.DOM.Attr.Rel where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Rel = Rel

instance Attr A_ Rel (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rel bothValues = unsafeAttribute $ Both
    { key: "rel", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr A_ Rel  String  where
  attr Rel value = unsafeAttribute $ This $ pure $ { key: "rel", value: prop' value }
instance Attr A_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rel", value: prop' value }

instance Attr Area_ Rel (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rel bothValues = unsafeAttribute $ Both
    { key: "rel", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr Area_ Rel  String  where
  attr Rel value = unsafeAttribute $ This $ pure $ { key: "rel", value: prop' value }
instance Attr Area_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rel", value: prop' value }

instance Attr Link_ Rel (NonEmpty.NonEmpty Event.Event  String ) where
  attr Rel bothValues = unsafeAttribute $ Both
    { key: "rel", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "rel", value: prop' value })
instance Attr Link_ Rel  String  where
  attr Rel value = unsafeAttribute $ This $ pure $ { key: "rel", value: prop' value }
instance Attr Link_ Rel (Event.Event  String ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "rel", value: prop' value }

instance Attr everything Rel (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Rel bothValues = unsafeAttribute $ Both { key: "rel", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "rel", value: unset' })
instance Attr everything Rel  Unit  where
  attr Rel _ = unsafeAttribute $ This $ pure $ { key: "rel", value: unset' }
instance Attr everything Rel (Event.Event  Unit ) where
  attr Rel eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "rel", value: unset' }
