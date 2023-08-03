module Deku.DOM.Attr.Type where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Type = Type

instance Attr AnimateTransform_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both
    { key: "type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr AnimateTransform_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr AnimateTransform_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeColorMatrix_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both
    { key: "type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeColorMatrix_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeColorMatrix_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncA_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both
    { key: "type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncA_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncA_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncB_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both
    { key: "type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncB_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncB_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncG_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both
    { key: "type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncG_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncG_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeFuncR_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both
    { key: "type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeFuncR_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeFuncR_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr FeTurbulence_ Type (NonEmpty.NonEmpty Event.Event  String ) where
  attr Type bothValues = unsafeAttribute $ Both
    { key: "type", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "type", value: prop' value })
instance Attr FeTurbulence_ Type  String  where
  attr Type value = unsafeAttribute $ This $ pure $
    { key: "type", value: prop' value }
instance Attr FeTurbulence_ Type (Event.Event  String ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \value ->
    { key: "type", value: prop' value }

instance Attr everything Type (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Type bothValues = unsafeAttribute $ Both { key: "type", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "type", value: unset' })
instance Attr everything Type  Unit  where
  attr Type _ = unsafeAttribute $ This $ pure $ { key: "type", value: unset' }
instance Attr everything Type (Event.Event  Unit ) where
  attr Type eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "type", value: unset' }
