module Deku.DOM.Attr.OnPlay where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPlay = OnPlay

instance Attr anything OnPlay Cb where
  attr OnPlay bothValues = unsafeAttribute $ Both
    { key: "play", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "play", value: cb' value })
  pureAttr OnPlay value = unsafeAttribute $ This
    { key: "play", value: cb' value }
  unpureAttr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "play", value: cb' value }

instance Attr anything OnPlay (Effect Unit) where
  attr OnPlay bothValues = unsafeAttribute $ Both
    { key: "play", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "play", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPlay value = unsafeAttribute $ This
    { key: "play", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "play", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlay (Effect Boolean) where
  attr OnPlay bothValues = unsafeAttribute $ Both
    { key: "play", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "play", value: cb' (Cb (const value)) }
    )
  pureAttr OnPlay value = unsafeAttribute $ This
    { key: "play", value: cb' (Cb (const value)) }
  unpureAttr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "play", value: cb' (Cb (const value)) }

type OnPlayEffect =
  forall element. Attr element OnPlay (Effect Unit) => Event (Attribute element)

instance Attr everything OnPlay Unit where
  attr OnPlay bothValues = unsafeAttribute $ Both { key: "play", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "play", value: unset' })
  pureAttr OnPlay _ = unsafeAttribute $ This { key: "play", value: unset' }
  unpureAttr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "play", value: unset' }
