module Deku.DOM.Attr.OnPause where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPause = OnPause

instance Attr anything OnPause Cb where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pause", value: cb' value })
  pureAttr OnPause value = unsafeAttribute $ This
    { key: "pause", value: cb' value }
  unpureAttr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' value }

instance Attr anything OnPause (Effect Unit) where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPause value = unsafeAttribute $ This
    { key: "pause", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPause (Effect Boolean) where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pause", value: cb' (Cb (const value)) }
    )
  pureAttr OnPause value = unsafeAttribute $ This
    { key: "pause", value: cb' (Cb (const value)) }
  unpureAttr OnPause eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const value)) }

type OnPauseEffect =
  forall element
   . Attr element OnPause (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPause Unit where
  attr OnPause bothValues = unsafeAttribute $ Both
    { key: "pause", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pause", value: unset' })
  pureAttr OnPause _ = unsafeAttribute $ This { key: "pause", value: unset' }
  unpureAttr OnPause eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "pause", value: unset' }
