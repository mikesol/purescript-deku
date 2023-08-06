module Deku.DOM.Attr.OnPlay where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPlay = OnPlay

instance Attr anything OnPlay (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPlay bothValues = unsafeAttribute $ Both (pure 
    { key: "play", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "play", value: cb' value })
instance Attr anything OnPlay (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPlay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "play", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "play", value: cb' value })
instance Attr anything OnPlay  Cb  where
  attr OnPlay value = unsafeAttribute $ This $ pure $
    { key: "play", value: cb' value }
instance Attr anything OnPlay (Event.Event  Cb ) where
  attr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "play", value: cb' value }

instance Attr anything OnPlay (ST.ST Global.Global  Cb ) where
  attr OnPlay iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "play", value: cb' value }

instance Attr anything OnPlay (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPlay bothValues = unsafeAttribute $ Both (pure 
    { key: "play", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "play", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPlay (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPlay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "play", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "play", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPlay  (Effect Unit)  where
  attr OnPlay value = unsafeAttribute $ This $ pure $
    { key: "play", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPlay (Event.Event  (Effect Unit) ) where
  attr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "play", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlay (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPlay iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "play", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlay (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPlay bothValues = unsafeAttribute $ Both (pure 
    { key: "play", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "play", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPlay (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPlay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "play", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "play", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPlay  (Effect Boolean)  where
  attr OnPlay value = unsafeAttribute $ This $ pure $
    { key: "play", value: cb' (Cb (const value)) }
instance Attr anything OnPlay (Event.Event  (Effect Boolean) ) where
  attr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "play", value: cb' (Cb (const value)) }

instance Attr anything OnPlay (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPlay iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "play", value: cb' (Cb (const value)) }

instance Attr everything OnPlay (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPlay bothValues = unsafeAttribute $ Both (pure  { key: "play", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "play", value: unset' })
instance Attr everything OnPlay (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPlay (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->   { key: "play", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "play", value: unset' })
instance Attr everything OnPlay  Unit  where
  attr OnPlay _ = unsafeAttribute $ This $ { key: "play", value: unset' }
instance Attr everything OnPlay (Event.Event  Unit ) where
  attr OnPlay eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "play", value: unset' }

instance Attr everything OnPlay (ST.ST Global.Global  Unit ) where
  attr OnPlay iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "play", value: unset' }
