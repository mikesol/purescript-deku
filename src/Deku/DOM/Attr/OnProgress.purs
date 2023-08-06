module Deku.DOM.Attr.OnProgress where

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

data OnProgress = OnProgress

instance Attr anything OnProgress (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "progress", value: cb' value })
instance Attr anything OnProgress (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnProgress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "progress", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "progress", value: cb' value })
instance Attr anything OnProgress  Cb  where
  attr OnProgress value = unsafeAttribute $ This $ pure $
    { key: "progress", value: cb' value }
instance Attr anything OnProgress (Event.Event  Cb ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' value }

instance Attr anything OnProgress (ST.ST Global.Global  Cb ) where
  attr OnProgress iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "progress", value: cb' value }

instance Attr anything OnProgress (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnProgress (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnProgress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "progress", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnProgress  (Effect Unit)  where
  attr OnProgress value = unsafeAttribute $ This $ pure $
    { key: "progress", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnProgress (Event.Event  (Effect Unit) ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnProgress (ST.ST Global.Global  (Effect Unit) ) where
  attr OnProgress iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "progress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnProgress (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const value)) }
    )
instance Attr anything OnProgress (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnProgress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "progress", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "progress", value: cb' (Cb (const value)) }
    )
instance Attr anything OnProgress  (Effect Boolean)  where
  attr OnProgress value = unsafeAttribute $ This $ pure $
    { key: "progress", value: cb' (Cb (const value)) }
instance Attr anything OnProgress (Event.Event  (Effect Boolean) ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "progress", value: cb' (Cb (const value)) }

instance Attr anything OnProgress (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnProgress iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "progress", value: cb' (Cb (const value)) }

instance Attr everything OnProgress (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnProgress bothValues = unsafeAttribute $ Both (pure 
    { key: "progress", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "progress", value: unset' })
instance Attr everything OnProgress (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnProgress (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "progress", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "progress", value: unset' })
instance Attr everything OnProgress  Unit  where
  attr OnProgress _ = unsafeAttribute $ This $ pure $
    { key: "progress", value: unset' }
instance Attr everything OnProgress (Event.Event  Unit ) where
  attr OnProgress eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "progress", value: unset' }

instance Attr everything OnProgress (ST.ST Global.Global  Unit ) where
  attr OnProgress iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "progress", value: unset' }
