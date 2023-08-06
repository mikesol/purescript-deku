module Deku.DOM.Attr.OnTransitionend where

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

data OnTransitionend = OnTransitionend

instance Attr anything OnTransitionend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "transitionend", value: cb' value })
instance Attr anything OnTransitionend (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTransitionend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "transitionend", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "transitionend", value: cb' value })
instance Attr anything OnTransitionend  Cb  where
  attr OnTransitionend value = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: cb' value }
instance Attr anything OnTransitionend (Event.Event  Cb ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionend", value: cb' value }

instance Attr anything OnTransitionend (ST.ST Global.Global  Cb ) where
  attr OnTransitionend iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "transitionend", value: cb' value }

instance Attr anything OnTransitionend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTransitionend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "transitionend", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTransitionend  (Effect Unit)  where
  attr OnTransitionend value = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTransitionend (Event.Event  (Effect Unit) ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value ->
      { key: "transitionend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionend (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTransitionend iValue = unsafeAttribute $ This $ iValue
    <#> \value ->
      { key: "transitionend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTransitionend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "transitionend", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "transitionend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTransitionend  (Effect Boolean)  where
  attr OnTransitionend value = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: cb' (Cb (const value)) }
instance Attr anything OnTransitionend (Event.Event  (Effect Boolean) ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "transitionend", value: cb' (Cb (const value)) }

instance Attr anything OnTransitionend (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTransitionend iValue = unsafeAttribute $ This $ iValue
    <#> \value -> { key: "transitionend", value: cb' (Cb (const value)) }

instance Attr everything OnTransitionend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTransitionend bothValues = unsafeAttribute $ Both (pure 
    { key: "transitionend", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "transitionend", value: unset' })
instance Attr everything OnTransitionend (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTransitionend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "transitionend", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "transitionend", value: unset' })
instance Attr everything OnTransitionend  Unit  where
  attr OnTransitionend _ = unsafeAttribute $ This $ pure $
    { key: "transitionend", value: unset' }
instance Attr everything OnTransitionend (Event.Event  Unit ) where
  attr OnTransitionend eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "transitionend", value: unset' }

instance Attr everything OnTransitionend (ST.ST Global.Global  Unit ) where
  attr OnTransitionend iValue = unsafeAttribute $ This $ iValue
    <#> \_ -> { key: "transitionend", value: unset' }
