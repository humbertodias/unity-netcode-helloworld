using Unity.Netcode;
using UnityEngine;
using System;

public class NetworkVariableTest : NetworkBehaviour
{
    private NetworkVariable<float> ServerNetworkVariable = new NetworkVariable<float>();    
    private NetworkVariable<float> ClientNetworkVariable = new NetworkVariable<float>();
    private float last_t = 0.0f;

    public override void OnNetworkSpawn()
    {
        if (IsServer)
        {
            ServerNetworkVariable.Value = 0.0f;
            Debug.Log("Server's var initialized to: " + ServerNetworkVariable.Value);
        }
    }

    void Update()
    {
        // var t_now = Time.time;
        // if (IsServer)
        // {
        //     ServerNetworkVariable.Value = ServerNetworkVariable.Value + 0.1f;
        //     if (t_now - last_t > 0.5f)
        //     {
        //         last_t = t_now;
        //         Debug.Log("Server set its var to: " + ServerNetworkVariable.Value + ", has client var at: "  + 
        //             ClientNetworkVariable.Value);
        //     }
        // }



        // if (IsServer)
        // {
        //     float theta = Time.frameCount / 10.0f;
        //     transform.position = new Vector3((float) Math.Cos(theta), 0.0f, (float) Math.Sin(theta));
        // }
    }
}
