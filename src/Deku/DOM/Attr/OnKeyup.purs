module Deku.DOM.Attr.OnKeyup where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnKeyup = OnKeyup

instance Attr anything OnKeyup (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "keyup", value: cb' value })
instance Attr anything OnKeyup  Cb  where
  attr OnKeyup value = unsafeAttribute $ This $ pure $
    { key: "keyup", value: cb' value }
instance Attr anything OnKeyup (Event.Event  Cb ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' value }

instance Attr anything OnKeyup (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnKeyup  (Effect Unit)  where
  attr OnKeyup value = unsafeAttribute $ This $ pure $
    { key: "keyup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnKeyup (Event.Event  (Effect Unit) ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeyup (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "keyup", value: cb' (Cb (const value)) }
    )
instance Attr anything OnKeyup  (Effect Boolean)  where
  attr OnKeyup value = unsafeAttribute $ This $ pure $
    { key: "keyup", value: cb' (Cb (const value)) }
instance Attr anything OnKeyup (Event.Event  (Effect Boolean) ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "keyup", value: cb' (Cb (const value)) }

type OnKeyupEffect =
  forall element
   . Attr element OnKeyup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeyup (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnKeyup bothValues = unsafeAttribute $ Both
    { key: "keyup", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "keyup", value: unset' })
instance Attr everything OnKeyup  Unit  where
  attr OnKeyup _ = unsafeAttribute $ This $ pure $ { key: "keyup", value: unset' }
instance Attr everything OnKeyup (Event.Event  Unit ) where
  attr OnKeyup eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "keyup", value: unset' }
