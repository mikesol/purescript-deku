module Deku.DOM.Attr.OnLoad where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnLoad = OnLoad

instance Attr anything OnLoad (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLoad bothValues = unsafeAttribute $ Both
    { key: "load", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "load", value: cb' value })
instance Attr anything OnLoad  Cb  where
  attr OnLoad value = unsafeAttribute $ This
    { key: "load", value: cb' value }
instance Attr anything OnLoad (Event.Event  Cb ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "load", value: cb' value }

instance Attr anything OnLoad (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLoad bothValues = unsafeAttribute $ Both
    { key: "load", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "load", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLoad  (Effect Unit)  where
  attr OnLoad value = unsafeAttribute $ This
    { key: "load", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLoad (Event.Event  (Effect Unit) ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoad (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLoad bothValues = unsafeAttribute $ Both
    { key: "load", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "load", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLoad  (Effect Boolean)  where
  attr OnLoad value = unsafeAttribute $ This
    { key: "load", value: cb' (Cb (const value)) }
instance Attr anything OnLoad (Event.Event  (Effect Boolean) ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "load", value: cb' (Cb (const value)) }

type OnLoadEffect =
  forall element. Attr element OnLoad (Effect Unit) => Event (Attribute element)

instance Attr everything OnLoad (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLoad bothValues = unsafeAttribute $ Both { key: "load", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "load", value: unset' })
instance Attr everything OnLoad  Unit  where
  attr OnLoad _ = unsafeAttribute $ This { key: "load", value: unset' }
instance Attr everything OnLoad (Event.Event  Unit ) where
  attr OnLoad eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "load", value: unset' }
