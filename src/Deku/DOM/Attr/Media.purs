module Deku.DOM.Attr.Media where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.A (A_)
import Deku.DOM.Elt.Area (Area_)
import Deku.DOM.Elt.Link (Link_)
import Deku.DOM.Elt.Source (Source_)
import Deku.DOM.Elt.Style (Style_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Media = Media

instance Attr A_ Media (NonEmpty.NonEmpty Event.Event  String ) where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "media", value: prop' value })
instance Attr A_ Media  String  where
  attr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
instance Attr A_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Area_ Media (NonEmpty.NonEmpty Event.Event  String ) where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "media", value: prop' value })
instance Attr Area_ Media  String  where
  attr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
instance Attr Area_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Link_ Media (NonEmpty.NonEmpty Event.Event  String ) where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "media", value: prop' value })
instance Attr Link_ Media  String  where
  attr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
instance Attr Link_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Source_ Media (NonEmpty.NonEmpty Event.Event  String ) where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "media", value: prop' value })
instance Attr Source_ Media  String  where
  attr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
instance Attr Source_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr Style_ Media (NonEmpty.NonEmpty Event.Event  String ) where
  attr Media bothValues = unsafeAttribute $ Both
    { key: "media", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "media", value: prop' value })
instance Attr Style_ Media  String  where
  attr Media value = unsafeAttribute $ This
    { key: "media", value: prop' value }
instance Attr Style_ Media (Event.Event  String ) where
  attr Media eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "media", value: prop' value }

instance Attr everything Media (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Media bothValues = unsafeAttribute $ Both { key: "media", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "media", value: unset' })
instance Attr everything Media  Unit  where
  attr Media _ = unsafeAttribute $ This { key: "media", value: unset' }
instance Attr everything Media (Event.Event  Unit ) where
  attr Media eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "media", value: unset' }
