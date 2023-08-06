module Deku.DOM.Attr.OnPointerlockchange where

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

data OnPointerlockchange = OnPointerlockchange

instance Attr anything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockchange", value: cb' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' value }
    )
instance Attr anything OnPointerlockchange (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnPointerlockchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerlockchange", value: cb' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' value }
    )
instance Attr anything OnPointerlockchange  Cb  where
  attr OnPointerlockchange value = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: cb' value }
instance Attr anything OnPointerlockchange (Event.Event  Cb ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "pointerlockchange", value: cb' value }

instance Attr anything OnPointerlockchange (ST.ST Global.Global  Cb ) where
  attr OnPointerlockchange iValue = unsafeAttribute $ This $
    iValue <#> \value -> { key: "pointerlockchange", value: cb' value }

instance Attr anything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockchange"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerlockchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnPointerlockchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerlockchange"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnPointerlockchange  (Effect Unit)  where
  attr OnPointerlockchange value = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerlockchange (Event.Event  (Effect Unit) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockchange (ST.ST Global.Global  (Effect Unit) ) where
  attr OnPointerlockchange iValue = unsafeAttribute $ This $
    iValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockchange", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerlockchange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnPointerlockchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "pointerlockchange", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "pointerlockchange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnPointerlockchange  (Effect Boolean)  where
  attr OnPointerlockchange value = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: cb' (Cb (const value)) }
instance Attr anything OnPointerlockchange (Event.Event  (Effect Boolean) ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const value)) }

instance Attr anything OnPointerlockchange (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnPointerlockchange iValue = unsafeAttribute $ This $
    iValue <#> \value ->
      { key: "pointerlockchange", value: cb' (Cb (const value)) }

instance Attr everything OnPointerlockchange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnPointerlockchange bothValues = unsafeAttribute $ Both (pure 
    { key: "pointerlockchange", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointerlockchange", value: unset' })
instance Attr everything OnPointerlockchange (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnPointerlockchange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "pointerlockchange", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "pointerlockchange", value: unset' })
instance Attr everything OnPointerlockchange  Unit  where
  attr OnPointerlockchange _ = unsafeAttribute $ This $ pure $
    { key: "pointerlockchange", value: unset' }
instance Attr everything OnPointerlockchange (Event.Event  Unit ) where
  attr OnPointerlockchange eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "pointerlockchange", value: unset' }

instance Attr everything OnPointerlockchange (ST.ST Global.Global  Unit ) where
  attr OnPointerlockchange iValue = unsafeAttribute $ This $
    iValue <#> \_ -> { key: "pointerlockchange", value: unset' }
